# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice
library(geosphere)
rad2deg <- function(rad) {(rad * 180) / (pi)}

# Read the data
data1 <- read.csv(file="1.csv", header=TRUE, sep=",")
data2 <- read.csv(file="2.csv", header=TRUE, sep=",")
data3 <- read.csv(file="3.csv", header=TRUE, sep=",")
data4 <- read.csv(file="10ms20to40.csv", header=TRUE, sep=",")


# Convert date column to Date object
data1$Date <- as.POSIXct(data1$Date)
data1$TimeDiff <- data1$Date - data1$Date[1]

data2$Date <-as.POSIXct(data2$Date)
data2$TimeDiff <- data2$Date - data2$Date[1] + max(data1$TimeDiff)

data3$Date <-as.POSIXct(data3$Date)
data3$TimeDiff <- data3$Date - data3$Date[1] + max(data2$TimeDiff)

data4$Date <-as.POSIXct(data4$Date)
data4$TimeDiff <- data4$Date - data4$Date[1] + max(data3$TimeDiff)

data <- rbind(data3, data4)

# Convert date column to Date object
#data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data

# Calculate the difference of each time point to the first (in seconds)
#data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)


# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)

#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)
data.toPlot$Mean <- mean(data.toPlot$Power)
data.toPlot$TanDirection = rad2deg(atan(data.toPlot$VelocityY/data.toPlot$VelocityX))
is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))
data.toPlot$TanDirection[is.nan(data.toPlot$TanDirection)] <- 90

data.toPlot$TanDirection[data.toPlot$TanDirection < 0] <- 180 + (data.toPlot$TanDirection[data.toPlot$TanDirection < 0])


#dY <- diff(data.toPlot$Velocity)/diff(data.toPlot$TimeDiffValue)  # the derivative of your function
#dX <- rowMeans(embed(data.toPlot$TimeDiffValue,2)) # centers the X values for plotting

ppi <- 200
#png(file=paste("10msTurnAngle2Power", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
par(mar=c(5.1, 4.1, 4.1, 8.1), xpd=TRUE)
plot(y=data.toPlot$Power, x=data.toPlot$TimeDiffValue,type="l",
     col="black", lwd="1", ylab="Energy (Watts)", xlab="Time (in Seconds)", main="Turning angle limitation for 10 m/s")
points(x=data.toPlot$TimeDiffValue[102], y=data.toPlot$Power[102], pch=1)
points(x=data.toPlot$TimeDiffValue[132], y=data.toPlot$Power[132], pch=2)
points(x=data.toPlot$TimeDiffValue[162], y=data.toPlot$Power[162], pch=3)
points(x=data.toPlot$TimeDiffValue[192], y=data.toPlot$Power[192], pch=4)
points(x=data.toPlot$TimeDiffValue[222], y=data.toPlot$Power[222], pch=5)
points(x=data.toPlot$TimeDiffValue[358], y=data.toPlot$Power[358], pch=6) 
points(x=data.toPlot$TimeDiffValue[388], y=data.toPlot$Power[388], pch=7) 
points(x=data.toPlot$TimeDiffValue[418], y=data.toPlot$Power[418], pch=8) 
points(x=data.toPlot$TimeDiffValue[448], y=data.toPlot$Power[448], pch=9) 
points(x=data.toPlot$TimeDiffValue[478], y=data.toPlot$Power[478], pch=10)

legend("topright", inset=c(-0.22,0), legend=c("22 Degrees", "24 Degrees", "26 Degrees", "28 Degrees", "30 Degrees",
                                             "40 Degrees", "50 Degrees", "60 Degrees", "70 Degrees", "80 Degrees"), bty="n", pch=1:10, lty=1, lwd=1)

#dev.off()
