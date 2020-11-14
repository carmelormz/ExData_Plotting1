dataSet <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## ------------- CLEANING DATA ----------------
## Reformatting dates
dataSet$Date <- as.Date(dataSet$Date, "%d/%m/%Y")

## Getting data from selected dates
dataSet <- subset(dataSet, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(
  dataSet$Global_active_power, 
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  main = "Global Active Power",
  col = "red")

dev.copy(png, "plot1.png", width = 480, height = 480)

dev.off()

rm(list = ls())


