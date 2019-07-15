power_data <- read.table("D:/dls/R/project/lesson1/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
power_data$Global_active_power[is.na(power_data$Global_active_power)] = 0
power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
sub_metering_1 <- power_data$Sub_metering_1
sub_metering_2 <- power_data$Sub_metering_2
sub_metering_3 <- power_data$Sub_metering_3
slice_dates <- format(as.Date(power_data$Date, "%d/%m/%Y"), "%a")
plot_date_nums <- c(1:length(slice_dates))
#plot
par(mfrow=c(1,1))
plot(plot_date_nums, sub_metering_1, type = "l",col="black", xlab = "", ylab = "Energy sub metering", xaxt="n")
points(plot_date_nums, sub_metering_2, type = "l", col="red")
points(plot_date_nums, sub_metering_3, type = "l", col="blue")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"), lty = c(1,1,1))
dev.copy(png, file = "plot3.png")
dev.off()