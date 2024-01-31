
getwd()
setwd("C:\\Users\\chema\\Desktop\\formacionPracticar\\r-studio-curso")
getwd()

#leemos datos
data <- read.csv("P2-Section5-Homework-Data.csv")

head(data)      
tail(data, n=7) 
str(data)      
summary(data)      


#filtramos
data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]

nrow(data1960) 
nrow(data2013) 

head(data1960) 
head(data2013) 

#creamos datafrmaes con vectores
add1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

summary(add1960)
summary(add2013)

#unimos

head(data1960)
head(add1960)

merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")

head(merged1960)

str(merged1960)
str(merged2013)

#eliminar columnas
merged1960$Year <- NULL
merged2013$Year <- NULL

str(merged1960)
str(merged2013)



#graficos
library("ggplot2")


qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp,
  colour=Region,                               
  size=I(5), 
  alpha=I(0.6),                               
  main="Life Expectancy vs Fertility (1960)" 
)


qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp,
      colour=Region,                               
      size=I(5), 
      alpha=I(0.6),                               
      main="Life Expectancy vs Fertility (2013)" 
)




