
#cargar fichero
stats<-read.csv(file.choose())
stats


#leer fichero
getwd()
setwd("C:\\Users\\chema\\Desktop\\formacionPracticar\\r-studio-curso")
getwd()
stats<-read.csv("P2-Demographic-Data.csv")
stats


#resumen general
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats)
str(stats)
summary(stats)


#acceder a elementos
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]

#convertimos en factor
income<-stats$Income.Group
stats$Income.Group<-factor(stats$Income.Group)
levels(stats$Income.Group)
str(stats)

#10 primeras filas
stats[1:10,]
#filas 4 y 100
stats[c(4,100),]

is.data.frame(stats[1,])
is.data.frame(stats[,1])
#primera columna
stats[,1,drop=F]


#calculo entre columnas
stats$MyCalc<-stats$Birth.rate+stats$Internet.users
stats

#eliminamos columna
stats$MyCalc<-NULL


#filtro
filter<-stats$Internet.users<2
stats[filter,]

stats[stats$Birth.rate>40 &stats$Internet.users<2,]
stats[stats$Country.Name=="Spain",]
diferentes<-unique(stats$Income.Group)
diferentes


#graficos
library(ggplot2)
qplot(data=stats, x=Income.Group,y=Birth.rate,size=I(3))
qplot(data=stats, x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))
qplot(data=stats, x=Income.Group,y=Birth.rate,geom="boxplot")
qplot(data=stats, x=Internet.users,y=Birth.rate,size=I(3),colour=Income.Group)



#dataframe a partir de vectores
mydf<-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#nombres columnas
colnames(mydf)<-c("Country","Code","Region")
head(mydf)


mydf<-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)


#union dataframes
head(stats)
head(mydf)

#columna primer dataframe y columna segundo dataframe
merged<-merge(stats,mydf,by.x="Country.Code",by.y="Code")
head(merged)

#eliminamos columna
merged$Country<-NULL
str(merged)


#grafico
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(17),alpha=I(0.6),main="Birth rate vs Internet users")
