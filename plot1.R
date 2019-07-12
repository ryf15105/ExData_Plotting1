power_data <- read.table("D:/dls/R/project/lesson1/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
power_data$Global_active_power[is.na(power_data$Global_active_power)] = 0
plot_data <- power_data$Global_active_power[66637:69516]
par(mfrow=c(1,1))
hist(plot_data, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()