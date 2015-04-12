###Plot4

### Read Data
data=read.table("household_power_consumption.txt", sep=";", header=TRUE)

###Convert date to required format
data$Date=as.Date(data$Date, "%d/%m/%Y")

###Subset data to required dates
test_data = (subset(data, Date=="2007-02-01" | Date=="2007-02-02"))

### Convert to numeric
test_data$Sub_metering_1=as.numeric(as.character(test_data$Sub_metering_1))
test_data$Sub_metering_2=as.numeric(as.character(test_data$Sub_metering_2))
test_data$Sub_metering_3=as.numeric(as.character(test_data$Sub_metering_3))

test_data$Global_active_power = as.numeric(as.character(test_data$Global_active_power))
test_data$Global_reactive_power = as.numeric(as.character(test_data$Global_reactive_power))
test_data$Voltage = as.numeric(as.character(test_data$Voltage))

###Convert Date/Time to Posix
test_data$DateTime = paste(test_data$Date, test_data$Time)
test_data$DateTime=as.POSIXct(test_data$DateTime, "%Y-%m-%d %H:%M:%S")

##Start Plot
with(test_data, par(mfrow=c(2,2)))
par(mfrow=c(2,2))

##Graph 1
plot(test_data$DateTime, test_data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##Graph 2
plot(test_data$DateTime, test_data$Voltage, type="l", 
     ylab="voltage", xlab="datetime")

##Graph3
plot(test_data$DateTime, test_data$Sub_metering_1, type="n", 
     ylab="Energy Sub metering", xlab="")
points(test_data$DateTime, test_data$Sub_metering_1, col="black", type="l")
points(test_data$DateTime, test_data$Sub_metering_2, col="red", type="l")
points(test_data$DateTime, test_data$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1, col=c("black", "red","blue"),seg.len=1, cex=0.5, bty="n")

##Graph4
plot(test_data$DateTime, test_data$Global_reactive_power, 
     ylab="Global_reactive_power", xlab="datetime",type="l")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

