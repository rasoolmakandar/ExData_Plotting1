###Plot3

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

###Convert Date/Time to Posix
test_data$DateTime = paste(test_data$Date, test_data$Time)
test_data$DateTime=as.POSIXct(test_data$DateTime, "%Y-%m-%d %H:%M:%S")

###Plot and save
with(test_data, plot(test_data$DateTime, test_data$Sub_metering_1, type="n", 
                     ylab="Energy Sub metering", xlab=""))
points(test_data$DateTime, test_data$Sub_metering_1, col="black", type="l")
points(test_data$DateTime, test_data$Sub_metering_2, col="red", type="l")
points(test_data$DateTime, test_data$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1, col=c("black", "red","blue"),seg.len=1)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()


