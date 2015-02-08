# Script to plot global active power from household power consumption

setwd("/Users/michem/Documents/Scripts/R/toolbox/ExData_Plotting1")

library(lubridate)

# Read in the household power comsumption data
power_consumption <- read.csv("household_power_consumption.txt", 
                              sep=";", na.strings='?', stringsAsFactors = FALSE)
format(object.size(power_consumption), units = "Mb")

# Data Cleaning
power_consumption$Date <- dmy(power_consumption$Date)

# Subsetting for the first two days of februari 2007
power_consumption.200702 <- subset(power_consumption, Date >= '2007-02-01' & Date < '2007-02-03') 

# Plotting a histogram of the global active power and saving to png
plot.new()
opar <- par()
par(cex=0.6, bg=NA)
with(power_consumption.200702, hist(Global_active_power, col="red", 
                                    main="Global active power", xlab='Global active power (kilowatts)')) 
dev.copy(png, file = "plot_1.png")
dev.off() 
par(opar) 

