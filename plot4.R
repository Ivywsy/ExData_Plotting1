#Read the whole csv file into R
data = read.csv("household_power_consumption.txt",sep = ";")

#Subset the dataset to the dates 2007-02-01 and 2007-02-02 only
Data$Date<- as.Date(data$Date, "%d/%m/%Y")
usefulData <- subset(data, data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"))

#Change the Time column format to PODIXlt
usefulData$Time<- strptime(paste(usefulData$Date, usefulData$Time), format = "%Y-%m-%d %H:%M:%S")

#Launch a PNG graphics device
png(filename = "plot4.png",width = 480,height = 480)

#Assign no. of col and row to the plot
par(mfrow = c(2, 2))

#Generate the top-left plot (Similar to Plot2)
plot(usefulData$Time,usefulData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#Generate the top-right plot
plot(usefulData$Time,usefulData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#Generate the bottom-left plot (Similar to Plot3)
plot(usefulData$Time, as.numeric(usefulData$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
points(usefulData$Time, as.numeric(usefulData$Sub_metering_2), type = "l", col = "red")
points(usefulData$Time, as.numeric(usefulData$Sub_metering_3), type = "l", col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, bty = "n")

#Generate the bottom-right plot
plot(usefulData$Time,usefulData$Global_reactive_power, type = "l", ylab= "Global_reactive_power", xlab = "datetime")

#Close graphics device 
dev.off()
