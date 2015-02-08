# Script to plot the timeseries of global active power from household power consumption

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

# Plotting the time series of the global active power
plot.new()
opar <- par()
par(cex=0.6, bg=NA)
with(power_consumption.200702, plot(DateTime, Global_active_power, 
                                    type = 'l', xlab='', ylab='Global active power (kilowatts)'))  
dev.copy(png, file = "plot_2.png") 
dev.off()  
par(opar) 

