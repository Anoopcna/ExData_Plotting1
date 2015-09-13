#Setting Home Directory

setwd("E:\\Anoop\\Books\\Data Science\\CourseTutorials\\Exploratary Data Analysis\\Week1")

#load the library sqldf
library(sqldf)

#Read The File filtering out the Data only for 1/2/2007 and 1/2/2007

Data=read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                  header=TRUE,eol="\n",stringsAsFactors=FALSE)

##Added a new column.

Data$Datetime=cbind(Datetime=paste(as.Date(Data$Date),Data$Time))


Data$Datetime <- as.POSIXct(Data$Datetime)


#Open Png Graphic Device

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
