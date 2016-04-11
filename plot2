setwd("D:/data_analysis/R/exdata")
data_org <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
data <- data_org
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$power <- as.numeric(data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(data$datetime, data$power, type="l", ylab="Global active power(kw)")

dev.off()
