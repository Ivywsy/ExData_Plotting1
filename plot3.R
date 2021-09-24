#Read the whole csv file into R
data = read.csv("household_power_consumption.txt",sep = ";")

#Subset the dataset to the dates 2007-02-01 and 2007-02-02 only
Data$Date<- as.Date(data$Date, "%d/%m/%Y")
usefulData <- subset(data, data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"))

#Change the Time column format to PODIXlt
usefulData$Time<- strptime(paste(usefulData$Date, usefulData$Time), format = "%Y-%m-%d %H:%M:%S")

#Launch a PNG graphics device
png(filename = "plot3.png",width = 480,height = 480)

#Plot the graph with Sub_metering_1 in black color first with valid labels argurment
plot(usefulData$Time, as.numeric(usefulData$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")

#Add points for Sub_metering_2 to the graph in red color
points(usefulData$Time, as.numeric(usefulData$Sub_metering_2), type = "l", col = "red")

#Add points for Sub_metering_3 to the graph in blue color
points(usefulData$Time, as.numeric(usefulData$Sub_metering_3), type = "l", col = "blue")

#Add legend for the plot
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)

#Close graphics device 
dev.off()
