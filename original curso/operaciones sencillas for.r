x<-rnorm(5)

for(i in x){
  print(i)
}

print(x[1])


for(j in 1:5){
  print(x[j])
}


N<-100
a<-rnorm(N)
b<-rnorm(N)

c<-a*b


d<-rep(NA,N)
for(i in 1:N){
  d[i]<-a[i]*b[i]
}

