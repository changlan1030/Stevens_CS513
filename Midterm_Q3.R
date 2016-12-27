rm(list=ls())

# Load the file
file_help<-read.csv("http://www.math.smith.edu/sasr/datasets/help.csv")
attach(file_help)

# Create a dataframe of id, age, daysanysub, substance and race group
dataset<-data.frame(id,age,daysanysub,substance,racegrp)

# Function for normalizing the data
mmnorm<-function(x,minx,maxx)
{
  return((x-minx)/(maxx-minx))
}

# Normalize daysanysub
normal_das<-mmnorm(daysanysub,min(daysanysub,na.rm=TRUE),max(daysanysub,na.rm=TRUE))

# Substitute the missing values of "daysanysub" with zero
normal_das[is.na(normal_das)]<-0

# Calculate Mean, Max, Median, STD of age
age_mean<-mean(age,na.rm=TRUE)
age_max<-max(age,na.rm=TRUE)
age_med<-median(age,na.rm=TRUE)
age_std<-sd(age,na.rm=TRUE)

# Create a categorical variable "age_group" as:
# 00-30 "Young"
# 31-60 "Middle Age"
# 61-   "Old"
age_group<-ifelse(age>=0&age<=30,"Young","err")
age_group<-ifelse(age>30&age<=60,"Middle Age",age_group)
age_group<-ifelse(age>60,"Old",age_group)

# Create an index(3,6,9,12,...)
idx<-seq(from=3,to=nrow(dataset),by=3)

# Create "training" and "test" datasets by:
# Choosing every third record as "test" and the remaining records as "training"
dataset_norm<-data.frame(id,age,normal_das,substance,racegrp)
test<-dataset_norm[idx,]
training<-dataset_norm[-idx,]

detach(file_help)
rm(list=ls())