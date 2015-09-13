#Setting Home Directory

setwd("E:\\Anoop\\Books\\Data Science\\CourseTutorials\\Exploratary Data Analysis\\Week1")

#load the library sqldf
library(sqldf)

#Read The File filtering out the Data only for 1/2/2007 and 1/2/2007

Data=read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')",header=TRUE,eol="\n")

#Change the format of the Date column

Data$Date=as.Date(Data$Date,format="%d/%m/%Y")


#Open Png Graphic Device

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")


###Ploting the Histogram###

hist(Data$Global_active_power,xlab='Global Active Power(kilowatts)',main='Global Active Power',col='Red')

#Closes the Specific Graphic Device.

dev.off()