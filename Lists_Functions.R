#------Lib-----#

library(ggplot2)

#-----Lists-----#

a <- list(1:3, "a", c(T,F,T), c(1.2,1.3,1.4))
str(a)
a[[1]]
a[1]
a <- list(element1=1:3, element2=c(T,F,T)) #Named list
a$element1 #Access named element
str(a[[1]][[2]])

#-----Challenge 2.1-----#

b <- list(1:4, list( 2:4, c(T,F,T)), 1:10)
str(b[[2]]) #Gets second element, list of 2:4 and TFT in this case
str(b[[2]][1]) #Gets the first element of the second element, 2:4 in this case
sum(b[[1]]) #Gets the sum of the first element 1:4 in this case
unlist(b[[2]]) #Returns the second item from the list, turned into int atomic vector

#----Using Lists-----#

ggplot(data=faithful)+
  geom_point(aes(x=waiting,y=eruptions))
c <- lm(eruptions ~ waiting, data=faithful)
c$coefficients
class(c)
str(coefficients(c))

#-----Functions-----#

d <- function(x)x^2
d(1:3)

e <- function(arg1, arg2, arg3) arg1*arg2+arg3
e(2,3,4) #Positional Arguments
e(2, arg3=4,3) #Named Arguments
e(arg3=4, arg2=3, 2)

f <- function(a=1,b=2) c(a,b) #Default Arguments
f() #Returns 1,2
f(10) #Returns 10,2
f(10,20) #Returns 10,20

g <- function(f,v) f(v)
g(min, c(2,4,6,8,10))

#-----Challenge 2.2-----#

evens <- function(x)x[c(F,T)]
evens(1:6)

evens2 <- function(x)x[ x%%2 == 0 ]
evens2(1:6)

#-----Challenge 2.3-----#

dup <- function(x) duplicated(x)
dup(c(1,2,3,4,5,1))

#-----Environnments-----#

h <- 2
i <- function(){ #Functions can use their own environment along with one level up
  j <- 1
  c(h,j)
}
i()

#-----Functionals-----#

k <- sapply(1:3,function(x)x*2) #input and appplies defined function to each element
l <- matrix(1:10,nrow=2)
apply( l, 1, sum) #Sum rows
apply( l, 2, sum) #Sum columns




