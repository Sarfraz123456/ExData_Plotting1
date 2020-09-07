
# Create data Variable
PowerData <- "./Kazisarfaraz/EDA/exdata_data_household_power_consumption/household_power_consumption.txt"

#Read Data
DataPC <- read.table(PowerData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Create subset of data as required 
SubDataPC <- DataPC[DataPC$Date %in% c("1/2/2007","2/2/2007") ,]

#COnvert the "Global_active_power" as numeric
globalActivePower <- as.numeric(SubDataPC$Global_active_power)

# Let us print the image file into png device
png("plot1.png", width=480, height=480)

#Let us print histogram of Global Active Power in our png file
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Close the device
dev.off()
