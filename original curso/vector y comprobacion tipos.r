vector<-c(2,3,66,55)
is.numeric(vector)
is.double(vector)
is.integer(vector)


vector1<-c(2L,3L,66L,55L)
is.numeric(vector1)
is.double(vector1)
is.integer(vector1)

vector2<-c("che","ks","slls","sdf","ads","sad")
is.character(vector2)

vector2[1]
vector2[-1]
vector2[-1]
vector2[1:3]
vector2[c(1,3,5)]
vector2[c(-2,-4)]
vector2[-1:-3]


seq(1,15)
1:15
seq(1,15,2)


d<-rep(3,20)

x<-c(40,29)
y<-rep(x,10)