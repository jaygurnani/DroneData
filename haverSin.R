# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice
library(geosphere)

# Read the data
data <- read.csv(file="secondRun.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data[data$Battery > 5,]

# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)

data.toPlot$Longitude.1<-data.toPlot$Longitude[c(2:length(data.toPlot$Longitude), 1)]
data.toPlot$Latitude.1<-data.toPlot$Latitude[c(2:length(data.toPlot$Latitude), 1)]
data.toPlot$TimeDiffDelta <- data.toPlot$TimeDiffValue[c(2:length(data.toPlot$TimeDiffValue), 1)] - data.toPlot$TimeDiffValue

# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)

#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)
data.toPlot$Mean <- mean(data.toPlot$Power)

#GPS Velocity


#data.toPlot <- data.frame(GPSDist = distHaversine(c(data.toPlot$Longitude, data.toPlot$Latitude), c(0,0)), data.toPlot)
distHaver<- data.frame(distHaversine(data.toPlot[, 2:3],  data.toPlot[, 24:25]))
distDelta <- data.frame(data.toPlot[, 26])
haverVel <- head(distHaver / distDelta, -1)
colnames(haverVel) <- "Velocity"
totalTimeDiff <- head(data.frame(data.toPlot[, 22]), -1)
colnames(totalTimeDiff) <-"TimeDiffValue"


#dY <- diff(data.toPlot$Velocity)/diff(data.toPlot$TimeDiffValue)  # the derivative of your function
#dX <- rowMeans(embed(data.toPlot$TimeDiffValue,2)) # centers the X values for plotting

ppi <- 200
png(file=paste("SecondExperimentGPS", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
plot(y=haverVel$Velocity, x=totalTimeDiff$TimeDiffValue,type="l",col="black", lwd="1", ylab="Speed (m/s)", xlab="Time In Seconds", main="GPS Calculated Speed")
#points(x=4.8299999, y=9.6104106, pch=1)
#points(x=6.81299996376038, y=9.6860727, pch=2)
#points(x=8.81, y=9.7025768, pch=3)
#points(x=10.819000005722, y=9.3520047, pch=4)
#points(x=12.8249998092651, y=9.6648853, pch=5) 

#legend("topleft", legend=c("5 Degrees", "10 Degrees", "15 Degrees", "20 Degrees", "25 Degrees"), bty="n", pch=1:5, lty=1, lwd=1)

dev.off()
