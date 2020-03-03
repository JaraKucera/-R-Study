v <- 1:10
summary(v)
x <- c(3,4,5,6,7)
x[1:2]
sum(x)
mean(x)
x > 5
dbl_var <- c(2.9,3.1,4.8)
typeof(dbl_var)
int_var <- c(0L,1L,2L)
typeof(int_var)
log_var <- c(TRUE,TRUE,FALSE,T,F)
typeof(log_var)
str_var <- c("Dublin","London","Edinburgh")
typeof(str_var)
str(dbl_var) #Function to show the structure of object
v3 <- seq(20,30,by=1)
str(v3)
v1 <- vector(mode="numeric", length=20) #Fixed vector of size 20 in advance, default = 0
v2 <- vector(mode="logical", length=5) #Fixed vector of size 5 in advnace, default = FALSE

#-----Coercion of atomic vectors-----#

#If character, everything turns to a character
#If logical, it will turn to any type
#If numeric, remain numeric unless character
#Integer remains integer for itself and logical, else transforms to numeric or character (L)

#-----Challenge 1.2-----#
#(1L,T,FALSE) v1 = integer
#(1L,T,FALSE, 2) v2 = numeric
#(T,FALSE, 2 ,"FALSE") v3 = character
#(2L, "FALSE") v4 = character
#(0L,1L,2.11) v5 = numeric


#-----Subsetting Atomic Vectors----#
x <- c(2.1,4.2,3.3,5.4)
x[c(1,4)]
x[-2] #Everything but second element
x[-(1:3)]

x <- 1:5
x[c(F,T,T,T,T)]

x <- c(1,4,5,9,6,3,7,8)
x[c(F,T)] #Even positions
x[c(T,F)] #Odd positions

x <- 1:5
lx <- x < 2
x[lx] #Gives the result where true
names(x) <- c("a","b","c","d","e") #Turns list into named list
x["a"]


#-----Challenge 1.3-----#

v <- 1:10
min <- min(v)
max <- max(v)
average <- mean(v)
x <- v > average
v[x]

#-----Vectorised if/else-----#

ans <- ifelse(v %% 2 == 0, "Even", "Odd")

#-----Samples-----#

sample(c("Y","N"), 10, prob=c(.2,.8), replace = T)

#-----NA-----#

x <- 1:5
x[3] <- NA
sum(x, na.rm = TRUE)
is.na(x) #Returns logical vector showing true where NA is located
which(is.na(x)) #Returns position of NA
x[!is.na(x)] #All without NA

#-----Challenge 1.4-----#

v1 <- sample(1:20,100,replace=T) #100 random numbers between 1 and 20
na_locs <- sample(1:100,10) #10 unique numbers between 1 and 100
v1[na_locs] <- NA #Set to NA where na_locs
locs <- which(is.na(v1)) #Get all locations of NA in sorted order

#-----Loops-----#
for(i in seq_along(x)){
  print(x)
}
sprintf("%s is %f feet tall", "Sven", 5.1)









