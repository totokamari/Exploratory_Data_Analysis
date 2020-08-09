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

plot(electricdata_subset$date_time, electricdata_subset$Global_active_power, type = "l", xlab = "Time", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
