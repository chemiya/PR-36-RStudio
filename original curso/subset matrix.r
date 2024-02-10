x<-c("a","b","c","d")
x[c(1,3)]
x[1]

Games[1:3,5:7]
Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])


Games[1,,drop=F]
Games[1,5,drop=F]


