##Setup

#Download data file
#setwd("/Users/bazilsansom/Documents/Rwd/Hopkins") #Set working directory. Need appropriate path here

## Reading and cleaning data
data=read.csv("household_power_consumption.txt", na.strings="?", sep=";", stringsAsFactors=F) #load dataset from working directory
data$Date <- as.Date(data$Date, format="%d/%m/%Y") #Format Date from chr to date
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S") # Form and format date-time variable
data$Time <- NULL # Ditch now redundant Time variable
data$Date <- NULL # Ditch now redundant Date variable
data <- subset(data, datetime > "2007-02-01 00:00:01" & datetime < "2007-02-02 24:00:00") # Subset data for data from the dates 2007-02-01 and 2007-02-02 period of interest

## Creating plots

# Plot 3
png("plot3.png", width=480, height=480)
plot(data$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="", xaxt = "n")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
axis(1, at=c(0,2879/2,2879), labels=c("Thu","Fri","Sat"))
legend("topright", c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"), col=c("black","red","blue"), lty=1)
dev.off()
