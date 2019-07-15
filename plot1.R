power_data <- read.table("D:/dls/R/project/lesson1/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
power_data$Global_active_power[is.na(power_data$Global_active_power)] = 0
power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
plot_data <- power_data$Global_active_power
par(mfrow=c(1,1))
hist(plot_data, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()