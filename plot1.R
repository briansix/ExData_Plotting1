# Get and unzip data file
fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="plot.zip", method="curl")
unzip("plot.zip")

# Import data, replace ? with NA
pdata <- read.csv("~/Desktop/Data Science/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?")

# Change class of date time fiends with strptime() and as.Date()
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")
pdata$Time <- strptime(pdata$Time, "%H:%M:%S")
pdata$Time <- strftime(pdata$Time, '%H:%M:%S')

# Subset for time range 2007-02-01-2007-02-02
pdata <- subset(pdata, Date == "2007-02-01" | Date == "2007-02-02")

# Create plot
with(pdata,hist(Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)"))

# Copy to PNG
dev.copy(png, filename = "plot1.png", width = 480, height = 480)
dev.off()


