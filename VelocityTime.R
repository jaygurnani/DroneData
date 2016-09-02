# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data <- read.csv(file="circle.csv", header=TRUE, sep=",")

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
data.toPlot <- data.toPlot[data.toPlot$TimeDiffValue < 15 ,]
#data.toPlotFinal <- data.toPlot[with(data.toPlot, order(Velocity)), ]

#ppi <- 200
#png(file=paste("14Velocity", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

plot(y=data.toPlot$Power, x=data.toPlot$TimeDiffValue, type="l", ylab="Velocity (m/s)", xlab="Time (seconds)", lty=1, col="Black", lwd=1)
#abline(lm(data.toPlot$Power ~ data.toPlot$Velocity), col="red")
#legend("topright", legend=c("Mean Watts = 154.5845"), pch=1, lty=1, lwd=3)

#dev.off()
