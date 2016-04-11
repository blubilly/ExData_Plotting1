setwd("D:/data_analysis/R/exdata")
data_org <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
data <- data_org
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$power <- as.numeric(data$Global_active_power)

head(data)

png("plot3.png", width=480, height=480)

plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy submetering")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.off()
