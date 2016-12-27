# 5.2
rm(list=ls())

# Load the file
churn<-read.csv("churn.csv")
attach(churn)

# Load the rows
CustServCalls<-churn[,20]
IntPlan<-churn[,5]
VMPlan<-churn[,6]

# Function for normalizing the data
mmnorm<-function(x,minx,maxx)
{
  return((x-minx)/(maxx-minx))
}

# Normalize
CustServCalls_norm<-mmnorm(CustServCalls,min(CustServCalls,na.rm=TRUE),max(CustServCalls,na.rm=TRUE))
IntPlan_norm<-ifelse(IntPlan=="yes",1,0)
VMPlan_norm<-ifelse(VMPlan=="yes",1,0)

# Combine
group<-cbind(IntPlan_norm,VMPlan_norm,CustServCalls_norm)

# Use kmeans and clustering algorithm to classify the customers into 3 groups
clgroup<-kmeans(group,3)
clgroup$cluster
clgroup$centers

# Plot the cluster and the centers
plot(group,col=clgroup$cluster)
points(clgroup$centers,col=1:2,pch=2,cex=4)

detach(churn)
rm(list=ls())