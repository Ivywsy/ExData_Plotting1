#Read the whole csv file into R
data = read.csv("household_power_consumption.txt",sep = ";")

#Subset the dataset to the dates 2007-02-01 and 2007-02-02 only
Data$Date<- as.Date(data$Date, "%d/%m/%Y")
usefulData <- subset(data, data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"))

#Change the Time column format to PODIXlt
usefulData$Time<- strptime(paste(usefulData$Date, usefulData$Time), format = "%Y-%m-%d %H:%M:%S")

#Launch a PNG graphics device
png(filename = "plot2.png",width = 480,height = 480)

#Generate the plot
plot(usefulData$Time,usefulData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Close graphics device 
dev.off()
