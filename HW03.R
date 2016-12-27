rm(list=ls())

# Load the following CSV file to your R environment:
# http://www.math.smith.edu/sasr/datasets/help.csv
file_help<-read.csv("http://www.math.smith.edu/sasr/datasets/help.csv")
attach(file_help)

# Create a dataframe of: id, pcs1, mcs1, substance, and race group
dataset<-data.frame(id,pcs1,mcs1,substance,racegrp)
View(dataset)

# Calculate: Mean, Med, STD, Max, Min of mcs1
mcs1_mean<-mean(mcs1,na.rm=TRUE)
mcs1_med<-median(mcs1,na.rm=TRUE)
mcs1_std<-sd(mcs1,na.rm=TRUE)
mcs1_max<-max(mcs1,na.rm=TRUE)
mcs1_min<-min(mcs1,na.rm=TRUE)

# Create a frequency table of substance vs. racegroup
table(substance,racegrp)

# Substitute the missing values of mcs1 by the overall average
mcs1[is.na(mcs1)]<-mcs1_mean
dataset2<-data.frame(id,pcs1,mcs1,substance,racegrp)
View(dataset2)

detach(file_help)
rm(list=ls())