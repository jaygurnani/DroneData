# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice
library(geosphere)

# Read the data
data <- read.csv(file="12-2.csv", header=TRUE, sep=",")

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

#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)
data.toPlot$Mean <- mean(data.toPlot$Power)
data.toPlot$MaxWifi <- do.call(pmax, data.toPlot[10:17])

ppi <- 200
#png(file=paste("Hovering between 4 and 18 meters - Altitude", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
#par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
plot(y=data.toPlot$Power, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", ylab="Altitude (meters)", xlab="Time in Seconds",
     main="Hovering between 4 and 18 meters - Altitude")
#points(x=data.toPlot$TimeDiffValue[67], y=data.toPlot$Velocity[67], pch=1)
#points(x=data.toPlot$TimeDiffValue[117], y=data.toPlot$Velocity[117], pch=2)
#points(x=data.toPlot$TimeDiffValue[157], y=data.toPlot$Velocity[157], pch=3)
#points(x=data.toPlot$TimeDiffValue[187], y=data.toPlot$Velocity[187], pch=4)
#points(x=data.toPlot$TimeDiffValue[207], y=data.toPlot$Velocity[207], pch=5) 
#points(x=data.toPlot$TimeDiffValue[217], y=data.toPlot$Velocity[217], pch=6)
#points(x=data.toPlot$TimeDiffValue[225], y=data.toPlot$Velocity[225], pch=7) 
#points(x=data.toPlot$TimeDiffValue[231], y=data.toPlot$Velocity[231], pch=8) 
#points(x=data.toPlot$TimeDiffValue[234], y=data.toPlot$Velocity[234], pch=9) 

#legend("topright",  inset=c(-0.25,0), legend=c("5s interval", "4s interval", "3s interval", "2s interval", 
#                           "1s interval", "0.75s interval", "0.5s interval", "0.25s interval", 
#                           "0.1s interval"), bty="n", pch=1:9, lty=1, lwd=1)

#dev.off()
