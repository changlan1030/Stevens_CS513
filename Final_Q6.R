rm(list=ls())

# Load the IRIS dataset
data(iris)

# Create a index(2,5,8,11,...)
idx<-seq(from=2,to=nrow(iris),by=3)

# Store every third record in a "test" dataset starting with the second record
test<-iris[idx,]

# Store the rest in the "training" dataset
training<-iris[-idx,]

rm(list=ls())