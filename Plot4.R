
# Create data Variable
PowerData <- "./Kazisarfaraz/EDA/exdata_data_household_power_consumption/household_power_consumption.txt"

#Read Data
DataPC <- read.table(PowerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Create subset of data as required 
SubDataPC <- DataPC[DataPC$Date %in% c("1/2/2007","2/2/2007") ,]

#convert the Date and Time variables to Date/Time classes using the
#strptime()and as.Date() functions.
DT <- strptime(paste(SubDataPC$Date, SubDataPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#COnvert the "Global_active_power", volatage and submetering variables  as numeric
GlobalActivePower <- as.numeric(SubDataPC$Global_active_power)
GlobalReactivePower <- as.numeric(SubDataPC$Global_reactive_power)

voltage <- as.numeric(SubDataPC$Voltage)
subMetering1 <- as.numeric(SubDataPC$Sub_metering_1)
subMetering2 <- as.numeric(SubDataPC$Sub_metering_2)
subMetering3 <- as.numeric(SubDataPC$Sub_metering_3)


png("plot4.png", width=480, height=480)
#Let us plot 4 graphs 2 by 2 dimentions withlines and legend 
par(mfrow = c(2, 2)) 

plot(DT, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DT, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DT, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
plot(DT, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, subMetering2, type="l", col="red")
lines(DT, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")



dev.off()
