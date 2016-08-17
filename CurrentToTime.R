# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data <- read.csv(file="Aug16th.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data[data$Battery > 18 & data$Battery < 82,]

# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)

# Multiple current and voltage to get Power
data.toPlot$CurrentPositive <- -(data.toPlot$Current)/1000

ppi <- 200
png(file=paste("SlowSpeedMeanCurrent", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

plot(x=data.toPlot$TimeDiffValue, y=data.toPlot$CurrentPositive, type="l", xlab="Time in Seconds", ylab="Current", lty=1, col="Black", lwd=1)
abline(a = mean(data.toPlot$CurrentPositive), b= 0, col="red")
legend("topright", legend=c("Mean Current (Amps) = 10.4846"), pch=1, lty=1, lwd=3)

dev.off()