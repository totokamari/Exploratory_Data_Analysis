## We will first import the data, clean it up some, and then subset it down to what we want to analyze

library(dplyr)
electricdata <- read.table("household_power_consumption.txt", sep = ";")
a1 <- as.vector(t(a)[,1])
names(electricdata) <- a1
electricdata <- electricdata[-c(1),]
electricdata_subset <- subset(electricdata, Date == "2/2/2007" | Date == "1/2/2007")
electricdata$Global_active_power <- as.numeric(as.character(C$Global_active_power))

## Convert to date

electricdata_subset$Date <- as.Date(electricdata_subset$Date, "%d/%m/%Y")
electricdata_subset$Weekday <- weekdays(electricdata_subset$Date)
electricdata_subset$date_time <- paste(electricdata_subset$Date, electricdata_subset$Time)
electricdata_subset$date_time <- as.POSIXct(electricdata_subset$date_time, format = "%Y-%m-%d %H:%M:%S", tz=Sys.timezone())

## Now we make the graph

par(mfrow = c(2,2))
plot(electricdata_subset$date_time, electricdata_subset$Global_active_power, type = "l", col = "black", xlab = "Time", ylab = "Global Active Power")
plot(electricdata_subset$date_time, electricdata_subset$Voltage, type = "l", col = "black", xlab = "Time", ylab = "Voltage")
plot(electricdata_subset$date_time, electricdata_subset$Sub_metering_1, type = "l", col = "black", ylab = "Energy Sub Metering")
lines(electricdata_subset$date_time, electricdata_subset$Sub_metering_2, type = "l", col = "red")
lines(electricdata_subset$date_time, electricdata_subset$Sub_metering_3, type = "l", col = "blue")
plot(electricdata_subset$date_time, electricdata_subset$Global_reactive_power, type = "l", col = "black", xlab = "Time", ylab = "Global Reactive Power")
dev.copy(png, file = "plot4.png")
dev.off()