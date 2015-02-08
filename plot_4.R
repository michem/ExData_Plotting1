# Multiple plots from household energy consumption

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

# Multiple plot
attach(power_consumption.200702)
plot.new()
opar <- par()
par(mfrow=c(2,2), cex=0.6, bg=NA)
plot(DateTime, Global_active_power, type = 'l', xlab = '', ylab = 'Global active power')
plot(DateTime, Voltage, type = 'l')
plot(DateTime, Sub_metering_1, type = 'l', xlab='', ylab = 'Energy sub metering') 
lines(DateTime,Sub_metering_2,col="red")
lines(DateTime,Sub_metering_3,col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_3","Sub_metering_3"), 
       lty=c(1,1,1), # symbols (lines)
       lwd=c(2.5,2.5),col=c("black","red","blue"),
       bty = "n") 
plot(DateTime, Global_reactive_power, type = 'l')

dev.copy(png, file = "plot_4.png")  
dev.off()
par(opar) 

