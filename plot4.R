setwd("D:/Online Courses/Data Science Foundations using R Specialization/Course 4 Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")
df = read.table('household_power_consumption.txt', sep=";", nrows = 300000, na.strings = "?", header=TRUE)

# convert the date and time variable to Date and time class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- format(strptime(df$Time, "%H:%M:%S"),"%H:%M:%S")

# Subset the data
df <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
df$datetime <- as.POSIXct(df$datetime)

# Plot plot4
par(mfrow = c(2, 2))
plot(df$Global_active_power ~ df$datetime, type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(df$Voltage ~ df$datetime, type = "l", xlab = "datetime", ylab = "Voltage")

plot(x, y1,type="l", ylab = "Energy sub metering", xlab = "")
lines(x,y2,col="red")
lines(x,y3, col ="blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(df$Global_reactive_power ~ df$datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()