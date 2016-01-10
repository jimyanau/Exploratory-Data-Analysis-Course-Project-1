## Getting full dataset
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)


## Subsetting data
subsetdata <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
rm(fulldata)

## Plot 1
GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
hist(GlobalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Copy Plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()