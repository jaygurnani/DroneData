# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice

# Read the data
data <- read.csv(file="ZigZag.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data[data$Battery > 22,]

# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)

# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)

#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)
#data.toPlotFinal <- data.toPlot[with(data.toPlot, order(VelocityX)), ]

#dY <- diff(data.toPlot$Velocity)/diff(data.toPlot$TimeDiffValue)  # the derivative of your function
#dX <- rowMeans(embed(data.toPlot$TimeDiffValue,2)) # centers the X values for plotting
#par(mar=c(5,5,2,2))
#powerTest <- data.toPlot$Power[1:923]
#ppi <- 200
#png(file=paste("ZigZagVelocity", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

plot(y=data.toPlot$Wifi6, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", ylab=expression(~Accleration ~(m/s^{2})), xlab="Time (seconds)")
#abline(lm(data.toPlot$Power ~ data.toPlot$Velocity), col="red")
#legend("topright", legend=c("Mean Watts = 154.5845"), pch=1, lty=1, lwd=3)

#dev.off()
