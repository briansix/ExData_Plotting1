# Get and unzip data file
fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="plot.zip", method="curl")
unzip("plot.zip")

# Import data, replace ? with NA
pdata <- read.csv("~/Desktop/Data Science/Exploratory Data Analysis/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?")

# Adding date/time field
pdata$Datetime <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")

# Subset for time range 2007-02-01-2007-02-02
pdata <- subset(pdata, Date == "1/2/2007" | Date == "2/2/2007")

# Create plot
with(pdata,plot(Datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
# Add line
with(pdata,lines(Datetime, Sub_metering_2, col="red"))
# Add line
with(pdata,lines(Datetime, Sub_metering_3, col="blue"))
# Add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = "solid")

# Copy to PNG
dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()


