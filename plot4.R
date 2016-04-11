
setwd("D:/data_analysis/R/exdata")
data_org <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
data <- data_org
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$apower <- as.numeric(data$Global_active_power)
data$rpower <- as.numeric(data$Global_reactive_power)
data$volt <- as.numeric(data$Voltage)
data$sub1 <- as.numeric(data$Sub_metering_1)
data$sub2 <- as.numeric(data$Sub_metering_2)
data$sub3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))
plot(data$datetime, data$apower, type="l", ylab="Globar active power", xlab="")
plot(data$datetime, data$volt, type="l", xlab="datetime", ylab="voltage")

plot(data$datetime, data$sub1, type="l", ylab="Energy submetering", xlab ="")
lines(data$datetime, data$sub2, type="l", col="red")
lines(data$datetime, data$sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data$datetime, data$rpower, type="l", xlab="datetime", ylab="Global reactive power")

dev.off()

