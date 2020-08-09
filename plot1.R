## We will first import the data, clean it up some, and then subset it down to what we want to analyze

library(dplyr)
electricdata <- read.table("household_power_consumption.txt", sep = ";")
a1 <- as.vector(t(a)[,1])
names(electricdata) <- a1
electricdata <- electricdata[-c(1),]
electricdata_subset <- subset(electricdata, Date == "2/2/2007" | Date == "1/2/2007")
electricdata$Global_active_power <- as.numeric(as.character(C$Global_active_power))

## Now we make the graph

hist(electricdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()


