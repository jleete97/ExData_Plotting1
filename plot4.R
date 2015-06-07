# plot4.R: Generate four-panel plot vs time:
# Global Active Power, Voltage, Energy sub metering, Global Reactive Power

# Read main data file (set classes to avoid interpreting first two columns as factors)
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
p <- read.table(file="household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2100000, colClasses = classes)

# Generate date-only (Date) and date/time (POSIXlt) columns from raw inputs.
p$date_only <- as.Date(p$Date, format="%d/%m/%Y")
p$date_time <- strptime(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")

# Sequence of allowed dates
date_filter <- seq(as.Date("2007-02-01"), to = as.Date("2007-02-02"), by = "1 day")

# Generate multi-panel plot to file
png(filename = "plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))

with(subset(p, date_only %in% date_filter),
{ plot(date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(date_time, Voltage, type="l", xlab="datetime")
  plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(date_time, Sub_metering_2, col="red")
    lines(date_time, Sub_metering_3, col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  plot(date_time, Global_reactive_power, type="l", xlab="datetime") })

dev.off()
