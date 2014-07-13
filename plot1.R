## read data from file and select rows within the sepecified data range

data <- read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")
data[,1] <- as.Date(data[,1],"%d/%m/%Y")
data <- data[data[,"Date"]== "2007-02-01" | data[,"Date"]== "2007-02-02",]

## plot the hist graph for global active power

png("plot1.png")
hist(data$Global_active_power, main ="Global Active Power", xlab= "Global Active Power (kilowatts)", col = "red")
dev.off()

