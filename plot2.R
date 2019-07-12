power_data <- read.table("D:/dls/R/project/lesson1/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
power_data$Global_active_power[is.na(power_data$Global_active_power)] = 0
plot_data <- power_data$Global_active_power[66637:69516]
slice_dates <- format(as.Date(power_data$Date[66637:69516], "%d/%m/%Y"), "%a")
plot_date_nums <- c(1:length(slice_dates))
par(mfrow=c(1,1))
plot(plot_date_nums, plot_data, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)", xaxt="n")
axis(1,at=c(1,1440,2880),labels = c("Thu","Fri","Sat"))
dev.copy(png, file = "plot2.png")
dev.off()