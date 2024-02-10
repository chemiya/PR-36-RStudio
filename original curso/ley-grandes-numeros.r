N<-100
counter<-0

#generamos N aleatorios
for(i in rnorm(N)){
  print(i)
  if(i>=-1 & i<=1){#valuamos si en intervalo
    counter<-counter+1
  }
}

answer<-counter/N
answer