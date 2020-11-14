library(tidyverse)

dataSet <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## ------------- CLEANING DATA ----------------
## Reformatting dates
dataSet$Date <- as.Date(dataSet$Date, "%d/%m/%Y")

## Getting data from selected dates
dataSet <- subset(dataSet, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

dataSet <- mutate(dataSet, datetime = ymd_hms(paste(Date, Time)))

## ---------- PLOTTING DATA ----------

plot(Sub_metering_1 ~ datetime, dataSet, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(Sub_metering_2 ~ datetime, dataSet, type = "l", col = "red")
lines(Sub_metering_3 ~ datetime, dataSet, type = "l", col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(1,1,1))

## ------------ COPYING PLOT -------------
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()

rm(list = ls())