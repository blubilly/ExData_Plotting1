
getwd()
setwd("D:/data_analysis/R/exdata")
data_org <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
data2 <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

str(data2)
power <- as.numeric(data2$Global_active_power)

png("plot1.png", width=480, height=480)

hist(power, col="red", main="Global active power", xlab="Global active power(kw)")

dev.off()
