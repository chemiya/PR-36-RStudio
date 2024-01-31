Charlie<-1:5
names(Charlie)<-c("a","b","c","d","e")
Charlie
Charlie["d"]
names(Charlie)

temp.vec<-rep(c("a","b","z"),each=3)
temp.vec

max<-matrix(temp.vec,3,3)
rownames(max)<-c("prim","seg","terc")
colnames(max)<-c("prim1","seg1","terc1")

max["seg","seg1"]<-0
max

