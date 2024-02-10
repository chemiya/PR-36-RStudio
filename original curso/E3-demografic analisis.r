
#cargar fichero
stats<-read.csv(file.choose())
stats





#leer fichero
getwd()
setwd("C:\\Users\\chema\\Desktop\\formacionPracticar\\r-studio-curso")
getwd()
stats<-read.csv("P2-Demographic-Data.csv")
head(stats)







#resumen general
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats)
str(stats)
summary(stats)

print(class(stats))
#distribucion
distribucion <- table(stats$Income.Group)
print(distribucion)

colnames(stats)
#acceder a elementos
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]







print(class(stats))
str(stats)
#convertimos en factor
stats$Income.Group<-factor(stats$Income.Group)
levels(stats$Income.Group)
str(stats)

print(class(stats))
stats[1:10,]
stats[c(4,100),]
stats[,c(2,4)]
stats[,3:ncol(stats)]
stats[3:nrow(stats),]

print(class(stats))
is.data.frame(stats[1,])
is.data.frame(stats[,1])
print(class(stats[,1]))

#primera columna
stats[,1,drop=F]








print(class(stats))
#calculo entre columnas
stats$MyCalc<-stats$Birth.rate+stats$Internet.users
head(stats)

str(stats)
#eliminamos columna
stats$MyCalc<-NULL
str(stats)








#filtro
print(class(stats))
filter<-stats$Internet.users<2
filter

stats[stats$Birth.rate>40 &stats$Internet.users<2,]
stats[stats$Country.Name=="Spain",]







#añadir columna con valores segun condicion
library(dplyr)
print(class(stats))
stats <- stats %>%mutate(cumple_condicion = ifelse(Internet.users <2, "Cumple", "No Cumple"))
head(stats)








#elementos unicos
print(class(stats))
str(stats)
diferentes<-unique(stats$Income.Group)
diferentes

head(stats, n=10)
class(stats)
typeof(stats)







#graficos
library(ggplot2)
qplot(data=stats, x=Income.Group,y=Birth.rate,geom="boxplot")
qplot(data=stats, x=Internet.users,y=Birth.rate,size=I(3),colour=Income.Group)


qplot(data=stats, x=Income.Group,y=Birth.rate,size=I(3))
qplot(data=stats, x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))










#dataframe a partir de vectores
mydf<-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)








#nombres columnas
colnames(mydf)<-c("Country","Code","Region")
head(mydf)


mydf<-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,
                 Region=Regions_2012_Dataset)
head(mydf)
str(mydf)










#union dataframes
head(stats)
head(mydf)
class(stats)
class(mydf)

#columna primer dataframe y columna segundo dataframe
merged<-merge(stats,mydf,by.x="Country.Code",by.y="Code")
head(merged)

#eliminamos columna
merged$Country<-NULL
str(merged)












#grafico
class(merged)
str(merged)
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),
      shape=I(17),alpha=I(0.6),main="Birth rate vs Internet users")
