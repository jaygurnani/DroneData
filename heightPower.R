# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data <- read.csv(file="Aug19th - height.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data


# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)
data.toPlot$Mean <- mean(data.toPlot$Power)
# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)
data$TimeDiff <- data$Date - data$Date[1]
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)


ppi <- 200
#png(file=paste("Height", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

plot(y=data.toPlot$Power, x=data.toPlot$TimeDiffValue, type="p", ylab="Power in Watts", xlab="Altitude in meters", lty=1, col="Black", lwd=1)


#legend("topright", legend=c("Mean Watts = 154.5845"), pch=1, lty=1, lwd=3)

#dev.off()