getwd()

#leemos datos
setwd("C:/Users/chema/Desktop/formacionPracticar/r-studio-curso/Weather_Data")
Chicago<-read.csv("Chicago-F.csv",row.names=1)
NewYork<-read.csv("NewYork-F.csv",row.names=1)
Houston<-read.csv("Houston-F.csv",row.names=1)
SanFrancisco<-read.csv("SanFrancisco-F.csv",row.names=1)



head(Chicago)
head(NewYork)
head(Houston)
head(SanFrancisco)

is.data.frame(Chicago)

#conversion matriz
Chicago<- as.matrix(Chicago)
NewYork<- as.matrix(NewYork)
Houston<- as.matrix(Houston)
SanFrancisco<- as.matrix(SanFrancisco)

is.matrix(Chicago)


#lista con matrices
weather<-list(Chicago=Chicago,NewYork=NewYork,Houston=Houston,SanFrancisco=SanFrancisco)
weather


#acceso elemento
weather[1]
weather[[1]]
weather$Houston


Chicago
#valor medio de cada fila
apply(Chicago,1,mean)

mean(Chicago["DaysWithPrecip",])

#maximo de cada fila
apply(Chicago,1,max)

#media de los valores de cada columna
apply(Chicago,2,mean)



#bucle simulando lo mismo
Chicago

#media para cada fila
output<-NULL
for(i in 1:5){
  output[i]<-mean(Chicago[i,])
}
output
#ponemos nombres
names(output)<-rownames(Chicago)
output


apply(Chicago,1,mean)


#trasponer
t(Chicago)
newlist<-lapply(weather,t)
newlist


lapply(weather,rbind,NewRow=1:12)
?lapply

#media de cada fila
rowMeans(Chicago)
weather
lapply(weather,rowMeans)


#acceder elemento
weather[[1]][1]
lapply(weather,"[",1,1)

lapply(weather,"[",1,)

lapply(weather,"[",,3)


#lapply con funcion
lapply(weather,function(x) x[1,])
lapply(weather,function(x) x[,12])

lapply(weather,function(z) z[1,]-z[2,])

lapply(weather,function(z) round((z[1,]-z[2,])/z[2,],2))


#acceso elemento
lapply(weather,"[",1,7)
?sapply

#lo convierte en matriz
sapply(weather,"[",1,7)


lapply(weather,"[",1,10:12)

sapply(weather,"[",1,10:12)


lapply(weather,rowMeans)
round(sapply(weather,rowMeans),2)     

sapply(weather,function(z) round((z[1,]-z[2,])/z[2,],2))

sapply(weather,rowMeans,simplify=FALSE)


lapply(weather,apply,1,max)
lapply(weather,function(x) apply(x,1,max))
sapply(weather,apply,1,max)


#maximo
which.max(Chicago[1,])
#nombre
names(which.max(Chicago[1,]))
apply(Chicago,1,function(x) names(which.max(x)))
lapply(weather,function(y) apply(y,1,function(x) names(which.max(x))))
sapply(weather,function(y) apply(y,1,function(x) names(which.max(x))))
