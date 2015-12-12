## R Script to Generate Plot 3 for Course Project 1

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

# Convert Sub_metering to a numeric columns
plotData$Sub_metering_1 <- as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2 <- as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3 <- as.numeric(plotData$Sub_metering_3)

# Create the plot on the screen input
plot(plotData$DateTime, plotData$Sub_metering_1
     ,type="l"
     ,ylab="Energy Sub metering"
     ,xlab="")
lines(plotData$DateTime, plotData$Sub_metering_2, type="l", col="red")
lines(plotData$DateTime, plotData$Sub_metering_3, type="l", col="blue")
# Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lty=1, lwd=1,pt.cex=1, cex=0.60,text.font=1, col=c("black", "red", "blue"))

# Save the plot as plot3.png
dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()







