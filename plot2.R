##Setup

#Download data file
#setwd("/Users/bazilsansom/Documents/Rwd/Hopkins") #Set working directory. Need appropriate path here

## Reading and cleaning data
data=read.csv("household_power_consumption.txt", na.strings="?", sep=";", stringsAsFactors=F) #load dataset from working directory
data$Date <- as.Date(data$Date, format="%d/%m/%Y") #Format Date from chr to date
data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S") # Form and format date-time variable
data$Time <- NULL # Ditch now redundant Time variable
data <- subset(data, Date > "2007-02-01 00:00:01" & Date < "2007-02-02 24:00:00") # Subset data for data from the dates 2007-02-01 and 2007-02-02 period of interest

## Creating plots

# Plot 2
png("plot2.png", width=480, height=480)
plot(data$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="", xaxt = "n")
axis(1, at=c(0,2879/2,2879), labels=c("Thu","Fri","Sat"))
dev.off()

