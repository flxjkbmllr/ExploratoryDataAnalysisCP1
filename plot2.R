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

### Subset by date
epcwork<-epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02",]

### Plot 2
plot(epcwork$datetime, epcwork$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
