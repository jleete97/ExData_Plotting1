# plot4.R: Generate four-panel plot vs time:
# Global Active Power, Voltage, Energy sub metering, Global Reactive Power

# Read main data file
p <- read.table(file="household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2100000, colClasses = classes)

# Generate date-only (Date) and date/time (POSIXlt) columns from raw inputs.
p$date_only <- as.Date(p$Date, format="%d/%m/%Y")
p$date_time <- strptime(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")

# Sequence of allowed dates
date_filter <- seq(as.Date("2007-02-01"), to = as.Date("2007-02-02"), by = "1 day")

# Generate multi-panel plot to file
png(filename = "plot4.png", height = 480, width = 480)


dev.off()
