
rm(list=ls())
library(data.table)
# Create data Variable
PowerData <- "./Kazisarfaraz/EDA/exdata_data_household_power_consumption/household_power_consumption.txt"


#Read Data
DataPC <- read.table(PowerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Create subset of data as required 
SubDataPC <- DataPC[DataPC$Date %in% c("1/2/2007","2/2/2007") ,]



#convert the Date and Time variables to Date/Time classes using the
#strptime()and as.Date() functions.
datetime <- strptime(paste(SubDataPC$Date, SubDataPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#COnvert the "Global_active_power" as numeric
GlobalActivePower <- as.numeric(SubDataPC$Global_active_power)

#COnvertion of the sub-metering consumption variables to numeric (forcing)
subMetering1 <- as.numeric(SubDataPC$Sub_metering_1)
subMetering2 <- as.numeric(SubDataPC$Sub_metering_2)
subMetering3 <- as.numeric(SubDataPC$Sub_metering_3)

# Let us print the image file into png device
png("plot3.png", width=480, height=480)

#Let us print energy sub-metering data into our png file by adding legend to it.
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#let us close the device
dev.off()