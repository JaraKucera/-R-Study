#-----Libraries-----#
library(caret)

#------Load Dataset-----#
data("iris") #Attach dataset to the environment
dataset <- iris #Rename to dataset

#------Validation Dataset-----#
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE) #Use only 80% of rows as a list to train
validation <- dataset[-validation_index,] #20% for validation
dataset <- dataset[validation_index,] #80% for training

#-----Study Dataset-----#
dim(dataset) #Tells us the dimensions of the dataset
sapply(dataset, class) #List the data types of each attribute
head(dataset) #Look at the first 5 rows of the data
levels(dataset$Species) #List the levels of the class
percentage <- prop.table(table(dataset$Species)) * 100 #Get class distribution
cbind(freq=table(dataset$Species), percentage=percentage) #Frequency of each species
summary(dataset) #Summarises dataset, provides data such as mean, max, median etc.

#-----Virtualisation-----#
x <- dataset[,1:4] #X axis
y <- dataset[,5] #Y axis
par(mfrow=c(1,4)) #Create a boxplot of each variable
  for(i in 1:4){
    boxplot(x[,i], main=names(iris)[i])
  }
plot(y) #Barplot for class breakdown

#-----Virtualisation of Interaction-----#
featurePlot(x=x,y=y, plot="ellipse") #Create a scatter plot to visualise relationships between trends and attributes and class values
featurePlot(x=x,y=y,plot="box") #Box and whisker plot
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x,y=y,plot="density", scales=scales)

#-----Algorithms-----#
control <- trainControl(method="cv", number=10) #10-fold cross validation, train in 9 and test on 1
metric <- "Accuracy" #(success/total)*100

#Linear Discriminant Analysis
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)

#Classification and Regression Trees
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)

#k-Nearest Neighbours
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)

#Support Vector Machines with a linear kernel
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)

#Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

#-----Model Analysis-----#
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf)) #Summarise accuracy of models
summary(results)
dotplot(results)

print(fit.lda)

#-----Predictions-----#
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)
