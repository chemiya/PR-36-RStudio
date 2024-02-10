


mydata<-1:20
A<-matrix(mydata,4,5)
A

A[2,3]


B<-matrix(mydata,4,5, byrow=T)
B
B[2,5]


r1<-c("sdf","sdf1","dfs")
r2<-c("sdf2","sdf133","dfs44")
r3<-c("sdf24","sdf1s","dfs55")

c<-rbind(r1,r2,r3)
c

c1<-1:5
c2<-6:10
c3<-cbind(c1,c2)
c3
