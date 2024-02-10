
rm(answer)
x<-rnorm(1)
if(x>1){
  answer<-"X mas de 1"
}else if(x>=-1){
    answer<-"entre 1 y -1"
}else{
    answer<-"menos que -1"
  
}