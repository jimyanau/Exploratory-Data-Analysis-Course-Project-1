## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)


## Subsetting data
subsetdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
rm(fulldata)


## Convert variables
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)

## Plot 3
png("plot3.png", width=480, height=480)

plot(datetime, submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()