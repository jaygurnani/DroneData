# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data <- read.csv(file="height.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data


# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)


ppi <- 200
png(file=paste("height", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

plot(y=data.toPlot$Power, x=data.toPlot$Altitude, type="p", ylab="Power in Watts", xlab="Altitude in meters", lty=1, col="Black", lwd=1)


#legend("topright", legend=c("Mean Watts = 154.5845"), pch=1, lty=1, lwd=3)

dev.off()