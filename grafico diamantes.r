install.packages("ggplot2")
library(ggplot2)

?diamonds
?qplot()

qplot(data=diamonds,carat,price,colour=clarity,facets=.~clarity)
