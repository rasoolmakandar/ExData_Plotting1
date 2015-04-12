###Plot1

### Read Data
data=read.table("household_power_consumption.txt", sep=";", header=TRUE)

###Convert date to required format
data$Date=as.Date(data$Date, "%d/%m/%Y")

###Subset data to required dates
test_data = (subset(data, Date=="2007-02-01" | Date=="2007-02-02"))

### Convert to numeric
test_data$Global_active_power = as.numeric(as.character(test_data$Global_active_power))

###Generate histogram and save to png
with(test_data, hist(test_data$Global_active_power, main=paste("", "Global Active Power"), 
                     xlab = "Global Active Power (kilowatts)", col="red"))

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off() ## close device
