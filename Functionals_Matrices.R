#-----Functionals-----#

a <- function(x,...) sum(x,...)
a(c(1,2,3,NA))
a(c(1,2,3,NA),na.rm=T) #Can pass extra argument , which matches any unmatched argument

args <- list(c(1:3),NA,na.rm=T)
do.call(sum,args)

my_sapply <- function(x,f,...){
  out <- vector("list",length(x))
  for(i in seq_along(x)){
    out[[i]] <- f(x[[i]],...)
  }
  unlist(out)
}
my_sapply(1:5,function(v)v*2-10)

time <- seq(-10,10,by=0.1)
y <- sapply(time, function(x,a,b,c)a*x^2+b*x+c,a=2,b=-2,c=20)
b <- matrix(nrow=length(time), ncol=2)
colnames(b) <- c("Time","Y")
b[,1] <- time
b[,2] <- y
b[1:5,]
ggplot(data=data.frame(b),aes(x=Time,y=y))+
  geom_point()

#-----Matrices-----#

c <- matrix(1:6, ncol=3,nrow=2)
dim(c)
c <- rbind(c,7:9) #Add row
c <- cbind(c, 10:12) #Add column
rownames(c) <- c("R1","R2","R3")
colnames(c) <- c("C1","C2","C3","C4","C5")

c[1:2,]
c[,1]
c %*% c #Matrix multiplication
t(c) #Transpose
eigen(c) #Eigenvalues/Eigenvectors

d <- matrix(1:10,nrow=2)
apply(d,1,sum) #Sum rows
apply(d,2,sum) #Sum cols

#-----Challenge 3.1-----#

set.seed(100)
e <- sample(0:1,100,replace=T) 
e <- matrix(e,nrow=10)
rownames(e) <- LETTERS[1:10]
colnames(e) <- LETTERS[1:10]
diag(e) <- 0
follows <- apply(e,1,sum)
followed_by <- apply(e,2,sum)

#-----Challenge 3.2-----#

set.seed(10)
N = 10

cs1 <- rnorm(N, 72, 10) #Get random distribution based on 72 average and 10 standard deviation
cs2 <- rnorm(N, 65, 7)                                  
cs3 <- rnorm(N, 80, 9)
cs4 <- rnorm(N, 55, 7)
cs5 <- rnorm(N, 61, 5)

f <- cbind(cs1, cs2, cs3, cs4, cs5)
f <- cbind(f, avr=apply(f, 1, mean)) #Calculate average and add as a new column

#-----Replacement Functions-----#

g <- 1:6
dim(g) <- c(2,3) #Replaced 1x1 vector by 2x3 vector

`second<-` <- function(x, value){ #Replaces second value with input value
  x[2] <- value
  x
}
second(g) <- 78




