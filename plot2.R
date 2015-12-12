## R Script to Generate Plot 2 for Course Project 1

# Set working folder
setwd("/Sync/Development/Git Forks/ExData_Plotting1")

# Load raw data
allData <- read.table("data/household_power_consumption.txt",header = TRUE,stringsAsFactors = F,sep=";")

# Convert Date column to type Date
allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")

# Get the data we need for plotting
plotData <- allData[allData$Date %in% as.Date(c("2007-02-01","2007-02-02")) ,]

# Create a date+time column
plotData$DateTime <- paste(plotData$Date, plotData$Time, sep=" ")
plotData$DateTime <- strptime(plotData$DateTime,format="%Y-%m-%d %H:%M:%S")

# Convert Global_active_power to a numeric column
plotData$Global_active_power <- as.numeric(plotData$Global_active_power)

# Create the plot on the screen input
plot(plotData$DateTime, plotData$Global_active_power
     , type="l"
     , xlab=""
     , ylab="Global Active Power (kilowatts)")

# Save the plot as plot2.png
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()





