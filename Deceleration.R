# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data <- read.csv(file="3.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data[data$Battery > 18,]

# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)

# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)

#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)

#Remove extra data
data.toPlot <- data.toPlot[data.toPlot$TimeDiffValue > 19 & data.toPlot$TimeDiffValue < 27,]

ppi <- 200
png(file=paste("3AcclerationSpeed", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)
plot(y=data.toPlot$Velocity, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", xlab="Time (seconds)", ylab="Speed (m/s)")
dev.off()

png(file=paste("3AcclerationPower", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)
plot(y=data.toPlot$Power, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", xlab="Time (seconds)", ylab="Power (Watts)")

dev.off()

