# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data <- read.csv(file="Flying10mBatteryDrainRepeat.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data


# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)

# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)

data.toPlotFinal <- aggregate(data.toPlot$Power, by=list(Battery=data.toPlot$Battery), FUN=sum)

plot(x=data.toPlotFinal$Battery, xlim=c(100, 0), y=data.toPlotFinal$x, type="l", xlab="Battery(%)", ylab="Power in Watts per percentage", lty=1, col="Black", lwd=3)
abline(lm(data.toPlotFinal$x ~ data.toPlotFinal$Battery), col="red")

#dev.off()