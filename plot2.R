library(tidyverse)
dataSet <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## ------------- CLEANING DATA ----------------
## Reformatting dates
dataSet$Date <- as.Date(dataSet$Date, "%d/%m/%Y")

## Getting data from selected dates
dataSet <- subset(dataSet, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

dataSet <- mutate(dataSet, datetime = ymd_hms(paste(Date, Time)))

## ---------- PLOTTING DATA ----------
plot(Global_active_power ~ datetime, dataSet, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)

## ------------ COPYING PLOT -------------
dev.copy(png, "plot2.png", width = 480, height = 480)

dev.off()

rm(list = ls())