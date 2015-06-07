# plot1.R: Generate histogram of Global Active power vs. Frequency

# Read main data file (set classes to avoid interpreting first two columns as factors)
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
p <- read.table(file="household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2100000, colClasses = classes)

# Generate date-only (Date) and date/time (POSIXlt) columns from raw inputs.
p$date_only <- as.Date(p$Date, format="%d/%m/%Y")
p$date_time <- strptime(paste(p$Date, p$Time), format="%d/%m/%Y %H:%M:%S")

# Sequence of allowed dates
date_filter <- seq(as.Date("2007-02-01"), to = as.Date("2007-02-02"), by = "1 day")

# Generate histogram to file
png(filename = "plot1.png", height = 480, width = 480)

hist(p[p$date_only %in% date_filter, "Global_active_power"], col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
