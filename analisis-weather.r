#analisis weather

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
names(Chicago)
str(Chicago)







#conversion matriz
Chicago<- as.matrix(Chicago)
NewYork<- as.matrix(NewYork)
Houston<- as.matrix(Houston)
SanFrancisco<- as.matrix(SanFrancisco)
is.matrix(Chicago)
head(Chicago)




#lista con matrices
weather<-list(Chicago=Chicago,NewYork=NewYork,Houston=Houston,SanFrancisco=SanFrancisco)
weather

#acceso elemento
weather[1]
weather[[1]]
weather$Houston









#temperatura maxima media en Chicago
Chicago[1,]
apply(Chicago,1,mean)
mean(Chicago["DaysWithPrecip",])






#media de las filas
rowMeans(Chicago)
weather
lapply(weather,rowMeans)








#nuevo elemento
lapply(weather,function(z) round((z[1,]-z[2,])/z[2,],2))
resultados<-sapply(weather,function(z) round((z[1,]-z[2,])/z[2,],2))
resultados
class(resultados)




resultados<-as.data.frame(resultados)
resultados




#distribucion
library(dplyr)
resultados <- resultados %>%
  mutate(mes = row.names(.))
resultados


rownames(resultados) <- NULL
resultados





p<-ggplot(data=resultados,aes(x=mes,y=Chicago))
p+geom_point()+
  labs(title = "Variacion diferencia temperatura", x = "Mes", y = "Valor")





#reconvertir datos
max_ciudades<-sapply(weather,"[",1,)
max_ciudades<-as.data.frame(max_ciudades)

library(dplyr)
max_ciudades <- max_ciudades %>%
  mutate(Mes = row.names(.))
max_ciudades
rownames(max_ciudades) <- NULL
max_ciudades




ciudades<-colnames(max_ciudades)
ciudades
ciudades <- head(ciudades, -1)
ciudades


meses<-unique(max_ciudades$Mes)
meses


dataframe_analisis<-data.frame(Ciudad=character(),Mes=character(),Maximo=numeric())


for (i in 1:nrow(max_ciudades)) {
  fila<-max_ciudades[i,]
  
  for(k in seq_along(fila)){
    if(k<5){
      elemento_anadir<-data.frame(Ciudad=ciudades[k],Mes=max_ciudades[i,5],Maximo=fila[[k]])
      dataframe_analisis <- rbind(dataframe_analisis, elemento_anadir)
    }

  }
  
}


dataframe_analisis
p<-ggplot(data=dataframe_analisis,aes(x=Mes,y=Maximo))
p+geom_point(aes(color=Ciudad))


#video
ggplot(dataframe_analisis, aes(x = Mes, y = Maximo, color = Ciudad, group = Ciudad)) +
  geom_line() +
  labs(title = "Temperaturas por ciudadd", x = "Mes", y = "Temperatura") +
  scale_color_manual(values = c("SanFrancisco" = "red", "Chicago" = "blue", "NewYork" = "green","Houston"="purple"))
