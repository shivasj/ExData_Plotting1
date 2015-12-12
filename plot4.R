## R Script to Generate Plot 4 for Course Project 1

# Set working folder
setwd("/Sync/Development/Git Forks/ExData_Plotting1")

# Load raw data
allData <- read.table("data/household_power_consumption.txt",header = TRUE,stringsAsFactors = F,sep=";")

# Convert Date column to type Date
allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")

# Get the data we need for plotting
plotData <- allData[allData$Date %in% as.Date(c("2007-02-01","2007-02-02")) ,]