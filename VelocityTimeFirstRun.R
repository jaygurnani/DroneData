# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice
library(geosphere)

# Read the data
data <- read.csv(file="first.csv", header=TRUE, sep=",")

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
#png(file=paste("FirstExperimentSingleAnglePower", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
plot(y=data.toPlot$Velocity, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", ylab="Power (in Watts)", xlab="Time in Seconds")
points(x=7.00800013542175, y=data.toPlot$Power[70], pch=1)
points(x=10.0150001049042, y=data.toPlot$Power[101], pch=2)
points(x=13.0260000228882, y=data.toPlot$Power[131], pch=3)
points(x=16.0360000133514, y=data.toPlot$Power[161], pch=4)
points(x=19.058000087738, y=data.toPlot$Power[191], pch=5) 

legend("topleft", legend=c("1 Degrees", "2 Degrees", "3 Degrees", "4 Degrees", "5 Degrees"), bty="n", pch=1:5, lty=1, lwd=1)

#dev.off()
