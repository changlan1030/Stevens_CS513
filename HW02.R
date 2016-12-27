rm(list=ls())

# 2.1 Create the following x and y vectors:
# x=1,2,3
# y=11,12,13,14,15,16
x<-c(1,2,3)
y<-c(11,12,13,14,15,16)

# 2.2 Calculate and display z=x+y.
z<-x+y
z

# 2.3 Explain the results.
# x+y=(1,2,3)+(11,12,13,14,15,16)=(11+1,12+2,13+3,14+1,15+2,16+3)=(12,14,16,15,17,19)

# 2.4 Create a vector of your last name.
last_name<-"Chang"

# 2.5 Create a vector of your first name.
first_name<-"Lan"

# 2.6 Create a vector of your student ID.
id<-10405758

# 2.7 What are the length and data type of the "last name" vector? Why?
length(last_name)
mode(last_name)
typeof(last_name)
# There is only one element in the vector, so the length of the vector is 1.
# The type of "Chang" is character, so the type of the vector is also charactor.

# 2.8 Combine your first name, last name and student id into a single vector ("myinfo").
myinfo<-c(first_name,last_name,id)

# 2.9 Display "myinfo" in the Console.
myinfo

# 2.10 What are the length and data type of "myinfo"?
length(myinfo)
mode(myinfo)
typeof(myinfo)

# 2.11 Remove the "first_name" object.
rm("first_name")

# 2.12 Display "myinfo" in the Console again.
myinfo

# 2.13 Create a dataframe "roster" using the following table:
# First    Last     ID
# fname1   lname1   1111
# fname2   lname2   2222
roster<-data.frame(First=c("fname1","fname2"), Last=c("lname1","lname2"), ID=c(1111,2222))

# 2.14 View the "roster".
View(roster)

# 2.15 Export the data frame "roster" to a csv file.
write.csv(roster,file="roster.csv")

# 2.16 Import and view the following csv file:
# http://www.math.smith.edu/sasr/datasets/help.csv
file_help<-read.csv("http://www.math.smith.edu/sasr/datasets/help.csv")
View(file_help)

# 2.17 Remove all the objects in your session.
rm(list=ls())