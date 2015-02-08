# 

setwd("/Users/michem/Documents/Scripts/R/toolbox/ExData_Plotting1")

library(lubridate)

# Read in the household power comsumption data
power_consumption <- read.csv("household_power_consumption.txt", 
                              sep=";", na.strings='?', stringsAsFactors = FALSE)
format(object.size(power_consumption), units = "Mb")

# Data Cleaning
power_consumption$Date <- dmy(power_consumption$Date)
power_consumption$DateTime <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), 
                                         format="%Y-%m-%d %H:%M:%S")

# Subsetting for the first two days of februari 2007
power_consumption.200702 <- subset(power_consumption, Date >= '2007-02-01' & Date < '2007-02-03') 

attach(power_consumption.200702)
plot.new()
plot(DateTime, Sub_metering_1, type = 'l', xlab='', ylab = 'Energy sub metering')  ## Create plot on screen device
lines(DateTime,Sub_metering_2,col="red")
lines(DateTime,Sub_metering_3,col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_3","Sub_metering_3"), # puts text in the legend
       lty=c(1,1,1), # symbols (lines)
       lwd=c(2.5,2.5),col=c("black", "red","blue")) 
dev.copy(png, file = "plot_3.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!

