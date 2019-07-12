power_data <- read.table("D:/dls/R/project/lesson1/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
power_data$Global_active_power[is.na(power_data$Global_active_power)] = 0
global_active_power <- power_data$Global_active_power[66637:69516]
voltage <- power_data$Voltage[66637:69516]
sub_metering_1 <- power_data$Sub_metering_1[66637:69516]
sub_metering_2 <- power_data$Sub_metering_2[66637:69516]
sub_metering_3 <- power_data$Sub_metering_3[66637:69516]
global_reactive_power <- power_data$Global_reactive_power[66637:69516]
slice_dates <- format(as.Date(power_data$Date[66637:69516], "%d/%m/%Y"), "%a")
plot_date_nums <- c(1:length(slice_dates))
#plot
par(mfrow=c(2,2), mar=c(4,4,0.5,1))
#first
plot(plot_date_nums, plot_data, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)", xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
#second
plot(plot_date_nums, voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
#third
plot(plot_date_nums, sub_metering_1, type = "l",col="black", xlab = "", ylab = "Energy sub metering", xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
points(plot_date_nums, sub_metering_2, type = "l", col="red")
points(plot_date_nums, sub_metering_3, type = "l", col="blue")
legend(900,max(sub_metering_1)+3,xjust = 0, yjust = 1,c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"), lty = c(1,1,1))
#fourth
plot(plot_date_nums, global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.copy(png, file = "plot4.png")
dev.off()