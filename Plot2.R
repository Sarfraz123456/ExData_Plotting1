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
GlobalActivePower <- as.numeric(SubDataPC$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
