# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice

# Read the data
data <- read.csv(file="freq5.csv", header=TRUE, sep=",")

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
#png(file=paste("FourthExperimentSingleAnglePower", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
plot(y=data.toPlot$Velocity, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", ylab="Power (in Watts)", xlab="Time in Seconds")
points(x=data.toPlot$TimeDiffValue[68], y=data.toPlot$Power[68], pch=1)
points(x=data.toPlot$TimeDiffValue[98], y=data.toPlot$Power[98], pch=2)
points(x=data.toPlot$TimeDiffValue[128], y=data.toPlot$Power[128], pch=3)
points(x=data.toPlot$TimeDiffValue[158], y=data.toPlot$Power[158], pch=4)
points(x=data.toPlot$TimeDiffValue[188], y=data.toPlot$Power[188], pch=5) 

legend("topleft", legend=c("16 Degrees", "17 Degrees", "18 Degrees", "19 Degrees", "20 Degrees"), bty="n", pch=1:5, lty=1, lwd=1)

#dev.off()
