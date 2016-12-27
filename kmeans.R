rm(list=ls())

# read file
file0<-read.csv("C:/Chang/CS513/Project/Crimes_-_2015.csv")
attach(file0)

# no null value
file1=na.omit(file0)

# date->year,month,day,hour24,minute,second
parts<-function(x) {
  m<-regexec("([0-9]*)(/)*([0-9]*)(/)*([0-9]*)( )*([0-9]*)(:)*([0-9]*)(:)*([0-9]*)( )*(A|P)", x)
  parts<-unlist(lapply(regmatches(x, m), `[`,  c(2L, 4L, 6L, 8L, 10L, 12L, 14L)))
  parts
}
datetime<-do.call(rbind,lapply(as.character(file1[,3]),parts))
datetime2<-data.frame(date_month=as.numeric(datetime[,1]),date_day=as.numeric(datetime[,2]),date_year=as.numeric(datetime[,3]),time_hour=as.numeric(datetime[,4]),time_minute=as.numeric(datetime[,5]),time_second=as.numeric(datetime[,6]),APM=datetime[,7])
datetime2$time_hour<-ifelse(datetime2$APM=="A"&datetime2$time_hour!=12|datetime2$APM=="P"&datetime2$time_hour==12,datetime2$time_hour,datetime2$time_hour+12)
file2<-data.frame(file1,datetime2)

# crime type
crime_type<-as.data.frame(table(file2$Primary.Type))
crime_type2<-crime_type[order(-crime_type[,2]),]
name<-crime_type2$Var1[1:10]
freq<-crime_type2$Freq[1:10]
tp<-barplot(freq,names.arg=name,col=rainbow(10),main="Crime Type")

# theft in map
theft<-file2[file2$Primary.Type=="THEFT",]
Latitude<-theft[,20]
Longitude<-theft[,21]
position<-data.frame(Longitude,Latitude)
#install.packages("ggplot2")
#library(ggplot2)
p<-ggplot(position,aes(x=Longitude,y=Latitude))
p+geom_point()
p+stat_density2d(aes(fill=..density..),geom="raster",contour=FALSE)

# theft: purse-snatching & pocket-picking in map
theft_type<-c("PURSE-SNATCHING","POCKET-PICKING")
theft2<-theft[theft$Description%in%theft_type,]
Latitude<-theft2[,20]
Longitude<-theft2[,21]
Description<-theft2[,7]
df<-data.frame(Longitude,Latitude,Description)
p<-ggplot(df,aes(x=Longitude,y=Latitude,color=Description))
p+geom_point()
p+stat_density2d()

# theft: purse-snatching & pocket-picking at downtown
theft2_downtown<-theft2[theft2$Latitude>=41.84&theft2$Latitude<=41.96&theft2$Longitude>=-87.67,]
Latitude<-theft2_downtown[,20]
Longitude<-theft2_downtown[,21]
df<-data.frame(Longitude,Latitude)
p<-ggplot(df,aes(x=Longitude,y=Latitude))
p+geom_point()+stat_density2d()

# theft: purse-snatching & pocket-picking at downtown: timeline
theft2_downtown_time<-as.data.frame(table(theft2_downtown$time_hour))
name<-theft2_downtown_time$Var1
freq<-theft2_downtown_time$Freq
tp<-barplot(freq,names.arg=name,col=rainbow(24),main="Timeline")

# night time
night_hour<-c(22,23,24,1,2,3,4,5)
file3<-file2[file2$time_hour%in%night_hour,]

# crime type at night
crime_type_night<-as.data.frame(table(file3$Primary.Type))
crime_type_night2<-crime_type_night[order(-crime_type_night[,2]),]
name<-crime_type_night2$Var1[1:10]
freq<-crime_type_night2$Freq[1:10]
tp<-barplot(freq,names.arg=name,col=rainbow(10),main="Crime Type @ Night")

# battery w/ gun at night
battery_type<-c("AGGRAVATED: HANDGUN","AGGRAVATED: OTHER DANG WEAPON","AGGRAVATED DOMESTIC BATTERY: OTHER DANG WEAPON")
battery_gun<-file3[file3$Primary.Type=="BATTERY"&file3$Description%in%battery_type,]
Latitude<-battery_gun[,20]
Longitude<-battery_gun[,21]
group<-cbind(Longitude,Latitude)
clgroup<-kmeans(group,15)
plot(group,col=clgroup$cluster,pch=20,main="Battery w/ Gun @ Night")
points(clgroup$centers,col=1:15,pch=19,cex=5)

detach(file0)
rm(list=ls())