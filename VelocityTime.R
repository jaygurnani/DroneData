# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice

# Read the data
data <- read.csv(file="14.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data[data$Battery > 5,]

# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)

# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)

#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)
data.toPlot$Mean <- mean(data.toPlot$Power)

#dY <- diff(data.toPlot$Velocity)/diff(data.toPlot$TimeDiffValue)  # the derivative of your function
#dX <- rowMeans(embed(data.toPlot$TimeDiffValue,2)) # centers the X values for plotting

#ppi <- 200
#png(file=paste("FirstExperiment", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
plot(y=data.toPlot$Velocity, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", ylab="Velocity (m/s)", xlab="Power (Watts)")
points(x=4.8299999, y=9.6104106, pch=1)
points(x=6.81299996376038, y=9.6860727, pch=2)
points(x=8.81, y=9.7025768, pch=3)
points(x=10.819000005722, y=9.3520047, pch=4)
points(x=12.8249998092651, y=9.6648853, pch=5) 

legend("topleft", legend=c("5 Degrees", "10 Degrees", "15 Degrees", "20 Degrees", "25 Degrees"), bty="n", pch=1:5, lty=1, lwd=1)

#dev.off()
