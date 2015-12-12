## R Script to Generate Plot 1 for the Assigment 1

# Set working folder
setwd("/Sync/Development/Git Forks/ExData_Plotting1")

# Load raw data
allData <- read.table("data/household_power_consumption.txt",header = TRUE,stringsAsFactors = F,sep=";")

# Convert Date column to type Date
allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")

# Get the data we need for plotting
plotData <- allData[allData$Date %in% as.Date(c("2007-02-01","2007-02-02")) ,]

# Convert Global_active_power to a numeric column
plotData$Global_active_power <- as.numeric(plotData$Global_active_power)

# Create the plot on the screen input
hist(plotData$Global_active_power
     , col = "red"
     , main = paste("Global Active Power")
     , xlab = "Global Active Power (kilowatts)")

# Save the plot as plot1.png
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()
