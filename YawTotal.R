# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data0 <- read.csv(file="yawFinal10.csv", header=TRUE, sep=",")
data3 <- read.csv(file="yawFinal20.csv", header=TRUE, sep=",")
data4 <- read.csv(file="yawFinal30.csv", header=TRUE, sep=",")
data5 <- read.csv(file="yawFinal40.csv", header=TRUE, sep=",")
data6 <- read.csv(file="yawFinal50.csv", header=TRUE, sep=",")
data7 <- read.csv(file="yawFinal60.csv", header=TRUE, sep=",")
data8 <- read.csv(file="yawFinal70.csv", header=TRUE, sep=",")
data9 <- read.csv(file="yawFinal80.csv", header=TRUE, sep=",")


#0
data0$Date <- as.POSIXct(data0$Date)
data0.toPlot <- data0
data0.toPlot$TimeDiff <- data0.toPlot$Date - data0.toPlot$Date[1]
data0.toPlot$TimeDiffValue <- as.numeric(data0.toPlot$TimeDiff)
data0.toPlot$Power <- as.double(-(data0.toPlot$Current/1000) * data0.toPlot$Voltage/1000)
data0.toPlot$AngularVelocity = 10
data0.toPlot$Mean <- mean(data0.toPlot$Power)

#3
data3$Date <- as.POSIXct(data3$Date)
data3.toPlot <- data3
data3.toPlot$TimeDiff <- data3.toPlot$Date - data3.toPlot$Date[1]
data3.toPlot$TimeDiffValue <- as.numeric(data3.toPlot$TimeDiff)
data3.toPlot$Power <- as.double(-(data3.toPlot$Current/1000) * data3.toPlot$Voltage/1000)
data3.toPlot$AngularVelocity = 20
data3.toPlot$Mean <- mean(data3.toPlot$Power)

#4
data4$Date <- as.POSIXct(data4$Date)
data4.toPlot <- data4
data4.toPlot$TimeDiff <- data4.toPlot$Date - data4.toPlot$Date[1]
data4.toPlot$TimeDiffValue <- as.numeric(data4.toPlot$TimeDiff)
data4.toPlot$Power <- as.double(-(data4.toPlot$Current/1000) * data4.toPlot$Voltage/1000)
data4.toPlot$AngularVelocity = 30
data4.toPlot$Mean <- mean(data4.toPlot$Power)

#5
data5$Date <- as.POSIXct(data5$Date)
data5.toPlot <- data5
data5.toPlot$TimeDiff <- data5.toPlot$Date - data5.toPlot$Date[1]
data5.toPlot$TimeDiffValue <- as.numeric(data5.toPlot$TimeDiff)
data5.toPlot$Power <- as.double(-(data5.toPlot$Current/1000) * data5.toPlot$Voltage/1000)
data5.toPlot$AngularVelocity = 40
data5.toPlot$Mean <- mean(data5.toPlot$Power)

#6
data6$Date <- as.POSIXct(data6$Date)
data6.toPlot <- data6
data6.toPlot$TimeDiff <- data6.toPlot$Date - data6.toPlot$Date[1]
data6.toPlot$TimeDiffValue <- as.numeric(data6.toPlot$TimeDiff)
data6.toPlot$Power <- as.double(-(data6.toPlot$Current/1000) * data6.toPlot$Voltage/1000)
data6.toPlot$AngularVelocity = 50
data6.toPlot$Mean <- mean(data6.toPlot$Power)

#7
data7$Date <- as.POSIXct(data7$Date)
data7.toPlot <- data7
data7.toPlot$TimeDiff <- data7.toPlot$Date - data7.toPlot$Date[1]
data7.toPlot$TimeDiffValue <- as.numeric(data7.toPlot$TimeDiff)
data7.toPlot$Power <- as.double(-(data7.toPlot$Current/1000) * data7.toPlot$Voltage/1000)
data7.toPlot$AngularVelocity = 60
data7.toPlot$Mean <- mean(data7.toPlot$Power)

#8
data8$Date <- as.POSIXct(data8$Date)
data8.toPlot <- data8
data8.toPlot$TimeDiff <- data8.toPlot$Date - data8.toPlot$Date[1]
data8.toPlot$TimeDiffValue <- as.numeric(data8.toPlot$TimeDiff)
data8.toPlot$Power <- as.double(-(data8.toPlot$Current/1000) * data8.toPlot$Voltage/1000)
data8.toPlot$AngularVelocity = 70
data8.toPlot$Mean <- mean(data8.toPlot$Power)

#9
data9$Date <- as.POSIXct(data9$Date)
data9.toPlot <- data9
data9.toPlot$TimeDiff <- data9.toPlot$Date - data9.toPlot$Date[1]
data9.toPlot$TimeDiffValue <- as.numeric(data9.toPlot$TimeDiff)
data9.toPlot$Power <- as.double(-(data9.toPlot$Current/1000) * data9.toPlot$Voltage/1000)
data9.toPlot$AngularVelocity = 80
data9.toPlot$Mean <- mean(data9.toPlot$Power)


# Extract the data from column name to plot
data.toPlot <- rbind(data0.toPlot, data3.toPlot, data4.toPlot, data5.toPlot, data6.toPlot, data7.toPlot, data8.toPlot, data9.toPlot)


#write.csv(data.toPlotFinal, file="toPlotFinal")
ppi <- 200
png(file=paste("AngleDegree", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#Final
plot(data.toPlot$Mean~ data.toPlot$AngularVelocity, data=data.toPlot, main="Mean Power vs Angular Velocity", xlab="Angular Velocity", ylab="Power in Watts")
#fit <- lm(data.toPlot$Mean ~ poly(data.toPlot$AngularVelocity, 1, raw=TRUE))
#points(data.toPlot$AngularVelocity, predict(fit), type="l", col="red", lwd=2)
dev.off()

