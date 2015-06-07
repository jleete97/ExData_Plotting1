# plot3.R: Plot Energy sub metering (by subtype - 1, 2, 3) over time

# Read main data file
p <- read.table(file="household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2100000, colClasses = classes)

# Generate date-only (Date) and date/time (POSIXlt) columns from raw inputs.
p$date_only <- as.Date(p$Date, format="%d/%m/%Y")
p$date_time <- strptime(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")

# Sequence of allowed dates
date_filter <- seq(as.Date("2007-02-01"), to = as.Date("2007-02-02"), by = "1 day")

# Generate plot to file
png(filename = "plot3.png", height = 480, width = 480)

with(subset(p, date_only %in% date_filter),
  { plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", oma=c(2, 2, 1, 1))
    lines(date_time, Sub_metering_2, col="red")
    lines(date_time, Sub_metering_3, col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))})

dev.off()
