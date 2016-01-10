## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)


## Subsetting data
subsetdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
rm(fulldata)


## Convert variables
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)

## Plot 2
plot(datetime, GlobalActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Copy Plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()