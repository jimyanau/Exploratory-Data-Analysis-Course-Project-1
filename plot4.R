## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)


## Subsetting data
subsetdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
rm(fulldata)


## Convert variables
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
Voltage <- as.numeric(subsetdata$Voltage)
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)
GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power)

## prepare graphic device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## Plot 1/4
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

## Plot 2/4
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot 3/4
plot(datetime, submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

## Plot 4/4
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()