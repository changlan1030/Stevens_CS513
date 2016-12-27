rm(list=ls())

# Load the IRIS dataset
data(iris)

# Create a index(1,6,11,16,...)
idx<-seq(from=1,to=nrow(iris),by=5)

# Store every fifth record in a "test" dataset starting with the first record
test<-iris[idx,]

# Store the rest in the "training" dataset
training<-iris[-idx,]

library(class)

# Use knn with k=1 and classify the test dataset
predict1<-knn(training[,-5],test[,-5],training[,5],k=1)

# Measure the performance of knn
table(Predict=predict1,Actual=test[,5])

# Use knn with k=2 and classify the test dataset
predict2<-knn(training[,-5],test[,-5],training[,5],k=2)

# Measure the performance of knn
table(Predict=predict2,Actual=test[,5])

# Use knn with k=5 and classify the test dataset
predict5<-knn(training[,-5],test[,-5],training[,5],k=5)

# Measure the performance of knn
table(Predict=predict5,Actual=test[,5])

# Use knn with k=10 and classify the test dataset
predict10<-knn(training[,-5],test[,-5],training[,5],k=10)

# Measure the performance of knn
table(Predict=predict10,Actual=test[,5])