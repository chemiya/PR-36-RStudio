
#vectores inicio
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)



#beneficios
profit <- revenue - expenses
profit

?round()


#impuestos
tax <- round(0.30 * profit, 2)
tax 


#quitando impuestos
profit.after.tax <- profit - tax
profit.after.tax


#margen
profit.margin <- round(profit.after.tax/ revenue, 2) * 100
profit.margin


#beneficios medios
mean_pat <- mean(profit.after.tax)
mean_pat


#meses con beneficios superiores a la media
good.months <- profit.after.tax > mean_pat
good.months

#meses con beneficios inferiores a la media
bad.months <- !good.months
bad.months


#mejor mes
best.month <- profit.after.tax == max(profit.after.tax)
best.month

best<-which(best.month)
best
best.value<-profit.after.tax[best]
best.value

#peor mes
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

worst<-which(worst.month)
worst
worst.value<-profit.after.tax[worst]
worst.value


#redondeos
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)


revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month



#matriz con todos los datos
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)


M
