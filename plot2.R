###Plot2

### Read Data
data=read.table("household_power_consumption.txt", sep=";", header=TRUE)

###Convert date to required format
data$Date=as.Date(data$Date, "%d/%m/%Y")

###Subset data to required dates
test_data = (subset(data, Date=="2007-02-01" | Date=="2007-02-02"))

### Convert to numeric
test_data$Global_active_power = as.numeric(as.character(test_data$Global_active_power))

###Convert Date/Time to Posix
test_data$DateTime = paste(test_data$Date, test_data$Time)
test_data$DateTime=as.POSIXct(test_data$DateTime, "%Y-%m-%d %H:%M:%S")

###Plot and save to png
with(test_data, plot(test_data$DateTime, test_data$Global_active_power, type="l", 
                     ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()