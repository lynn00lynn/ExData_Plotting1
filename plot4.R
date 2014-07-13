## read data from file and select rows within the sepecified data range

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")
data[,1] <- as.Date(data[,1],"%d/%m/%Y")
data <- data[data[,"Date"]== "2007-02-01" | data[,"Date"]== "2007-02-02",]

x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## plot the four graphs for global active power
png('plot4.png')

par(mfcol = c(2,2))

      
#plot1
plot( x,data$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")

#plot2
plot (x,data$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines (x,data$Sub_metering_2,type = "l", col = "red")
points (x,data$Sub_metering_3,type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))#plot4

#plot3      
plot( x, data$Voltage, type = "l",xlab = "datetime", ylab = "")

#plot4
plot(x,data$Global_reactive_power, type ='l', xlab ="datetime")
              

dev.off()