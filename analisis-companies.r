#analisis companias


#carga de datos
getwd()
setwd("C:\\Users\\chema\\Desktop\\formacionPracticar\\r-studio-curso")
companies_data <- read.csv("companies.csv",header = TRUE,na.strings = c(""))



#comprobar datos cargados
head(companies_data) 
summary(companies_data) 
str(companies_data) 
names(companies_data)
nrow(companies_data)
ncol(companies_data)




#elementos vacios con algun atributo vacio
companies_data[!complete.cases(companies_data),]
nrow(companies_data[!complete.cases(companies_data),])





#ponemos como factores
companies_data$Industry<-factor(companies_data$Industry)
str(companies_data)






#valores diferentes
levels(companies_data$Industry)

#valores unicos
unicos_estados<-unique(companies_data$State)
unicos_estados















#reemplazos cadenas
head(companies_data)
companies_data$Expenses<-gsub(" Dollars","",companies_data$Expenses)
head(companies_data)
companies_data$Expenses<-gsub(",","",companies_data$Expenses)
head(companies_data)
companies_data$Revenue<-gsub("\\$","",companies_data$Revenue)
head(companies_data)
companies_data$Revenue<-gsub(",","",companies_data$Revenue)
head(companies_data)
companies_data$Growth<-gsub("%","",companies_data$Growth)
head(companies_data)
str(companies_data)


tipo_columna <- class(companies_data$Expenses)
tipo_columna







#convertir a numero
companies_data$Expenses<-as.numeric(companies_data$Expenses)
companies_data$Revenue<-as.numeric(companies_data$Revenue)
companies_data$Growth<-as.numeric(companies_data$Growth)

tipo_columna <- class(companies_data$Expenses)
tipo_columna
str(companies_data)






#elementos vacios con algun atributo vacio
companies_data[!complete.cases(companies_data),]
nrow(companies_data[!complete.cases(companies_data),])







#filtramos companias con determinado numero de empleados
companies_data[which(companies_data$Employees==45),]











#eliminamos filas con valor nulo en este atributo
nrow(companies_data[!complete.cases(companies_data),])
companies_data<-companies_data[!is.na(companies_data$Industry),]
nrow(companies_data[!complete.cases(companies_data),])











#reiniciamos indices
rownames(companies_data)<-NULL
companies_data









#ponemos en este atributo el valor que corresponde
nrow(companies_data[!complete.cases(companies_data),])
companies_data[!complete.cases(companies_data),]
companies_data[is.na(companies_data$State) & companies_data$City=="New York","State"]<-"NY"
companies_data[c(11,377),]



companies_data[is.na(companies_data$State) & companies_data$City=="San Francisco",]
companies_data[is.na(companies_data$State) & companies_data$City=="San Francisco","State"]<-"CA"
companies_data[c(82,265),]

companies_data[!complete.cases(companies_data),]
nrow(companies_data[!complete.cases(companies_data),])





#calculamos mediana de la columna
median(companies_data[,"Employees"],na.rm=TRUE)
mean(companies_data[,"Employees"],na.rm=TRUE)







#mediana de una columna filtrando
med_emp_retail<-median(companies_data[companies_data$Industry=="Retail","Employees"],na.rm=TRUE)

#buscmos elemento y le ponemos valor
companies_data[is.na(companies_data$Employees) & companies_data$Industry=="Retail",]
companies_data[is.na(companies_data$Employees) & companies_data$Industry=="Retail","Employees"]<-med_emp_retail
companies_data[3,]



companies_data[companies_data$Industry=="Financial Services",]
companies_data[companies_data$Industry=="Financial Services","Employees"]

med_emp_financial<-median(companies_data[companies_data$Industry=="Financial Services","Employees"],na.rm=TRUE)
companies_data[is.na(companies_data$Employees) & companies_data$Industry=="Financial Services",]
companies_data[is.na(companies_data$Employees) & companies_data$Industry=="Financial Services","Employees"]<-med_emp_financial
companies_data[330,]

companies_data[!complete.cases(companies_data),]






med_grow_constr<-median(companies_data[companies_data$Industry=="Construction","Growth"],na.rm=TRUE)
med_grow_constr

companies_data[is.na(companies_data$Growth) & companies_data$Industry=="Construction",]
companies_data[is.na(companies_data$Growth) & companies_data$Industry=="Construction","Growth"]<-med_grow_constr
companies_data[8,]






med_revenue_constr<-median(companies_data[companies_data$Industry=="Construction","Revenue"],na.rm=TRUE)
med_revenue_constr

companies_data[is.na(companies_data$Revenue) & companies_data$Industry=="Construction",]
companies_data[is.na(companies_data$Revenue) & companies_data$Industry=="Construction","Revenue"]<-med_revenue_constr
companies_data[c(8,42),]

med_expenses_constr<-median(companies_data[companies_data$Industry=="Construction","Expenses"],na.rm=TRUE)
med_expenses_constr

companies_data[is.na(companies_data$Expenses) & companies_data$Industry=="Construction"& is.na(companies_data$Profit),]
companies_data[is.na(companies_data$Expenses) & companies_data$Industry=="Construction"& is.na(companies_data$Profit),"Expenses"]<-med_expenses_constr
companies_data[c(8,42),]











#este atributo lo calculamos a partir de otros
companies_data[is.na(companies_data$Profit),]
companies_data[is.na(companies_data$Profit),"Profit"]<-companies_data[is.na(companies_data$Profit),"Revenue"]-companies_data[is.na(companies_data$Profit),"Expenses"]
companies_data[c(8,42),]

companies_data[!complete.cases(companies_data),]

companies_data[is.na(companies_data$Expenses),"Expenses"]<-companies_data[is.na(companies_data$Expenses),"Revenue"]-companies_data[is.na(companies_data$Expenses),"Profit"]
companies_data[15,]

companies_data<-companies_data[complete.cases(companies_data),]












#dataframe analisis previo
head(companies_data)
colnames(companies_data)
str(companies_data)

#grafico puntos con 4 dimensiones (video)
p<-ggplot(data=companies_data)
p+geom_point(aes(x=Revenue,y=Expenses,colour=Industry,size=Profit))

#con linea curva
d<-ggplot(data=companies_data,aes(x=Revenue,y=Expenses,colour=Industry))
d+geom_point()+geom_smooth(fill=NA,size=1.2)

#de caja
f<-ggplot(data=companies_data,aes(x=Industry,y=Growth,colour=Industry))
f+geom_boxplot(size=1)

#de caja con puntos
f+geom_jitter()+geom_boxplot(size=1,alpha=0.5,outlier.color=NA)

#separando variso graficos
p<-ggplot(data=companies_data,aes(x=Revenue,y=Expenses,colour=State))
p+geom_point(size=3)+facet_grid(.~Industry)




#beneficios por industria
library(dplyr)
industria_beneficios <- companies_data %>%
  group_by(Industry) %>%
  summarise(Suma_Beneficios = mean(Profit)) %>%
  arrange(desc(Suma_Beneficios))


print(class(industria_beneficios))
industria_beneficios<- as.data.frame(industria_beneficios)
industria_beneficios


frecuencia <- table(companies_data$Industry)
frecuencia<- as.data.frame(frecuencia)
frecuencia
colnames(frecuencia)<-c("Industry","Cuenta")
frecuencia


merged_industry<-merge(industria_beneficios, frecuencia, by.x="Industry", by.y="Industry")
merged_industry
merged_industry$Media<-round(merged_industry$Suma_Beneficios/merged_industry$Cuenta,2)
merged_industry





#beneficios por area (video)
ggplot(merged_industry, aes(x = Industry, y = Cuenta)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Gráfico de Barras de proporción beneficios", x = "Industria", y = "Proporción")+
  theme(plot.title = element_text(hjust = 0.5))
