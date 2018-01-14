##### Exploratory Data Analysis - Course Project 1
##### Author: Felix Mueller
##### Date: 13Jan2018
##### setwd("/Users/Felix/Documents/DataScience/ExploratoryDataAnalysisCP1")

### Get data
epc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

### Convert to date/time
epc$datetime<-paste(epc$Date, epc$Time)
epc$datetime<-strptime(epc$datetime,"%d/%m/%Y %H:%M:%S")
epc$Date<-as.Date(epc$Date,format="%d/%m/%Y")

### subset by date
epcwork<-epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02",]

### Plot 3
plot(epcwork$datetime, epcwork$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(epcwork$datetime, epcwork$Sub_metering_2, type="l", col="red")
points(epcwork$datetime, epcwork$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.copy(png, file="plot3.png")
dev.off()
