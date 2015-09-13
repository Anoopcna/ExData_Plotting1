#Setting Home Directory

setwd("E:\\Anoop\\Books\\Data Science\\CourseTutorials\\Exploratary Data Analysis\\Week1")

#load the library sqldf
library(sqldf)

#Read The File filtering out the Data only for 1/2/2007 and 1/2/2007

Data=read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                  header=TRUE,eol="\n",stringsAsFactors=FALSE)

##Added a new column.

Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")

Data$Datetime=cbind(Datetime=paste(as.Date(Data$Date),Data$Time))


Data$Datetime <- as.POSIXct(Data$Datetime)


#Open Png Graphic Device

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

#plot graph
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_Rective_Power",xlab="")
})

  dev.off()
