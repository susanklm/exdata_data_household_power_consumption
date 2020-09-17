setwd("D:/Online Courses/Data Science Foundations using R Specialization/Course 4 Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")
df = read.table('household_power_consumption.txt', sep=";", nrows = 300000, na.strings = "?", header=TRUE)

# convert the date and time variable to Date and time class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$Time <- format(strptime(df$Time, "%H:%M:%S"),"%H:%M:%S")

# Subset the data
df <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#### Plot plot1
hist(df$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save plot1
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

