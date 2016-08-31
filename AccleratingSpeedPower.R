# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data3 <- read.csv(file="3.csv", header=TRUE, sep=",")
data4 <- read.csv(file="4.csv", header=TRUE, sep=",")
data5 <- read.csv(file="5.csv", header=TRUE, sep=",")
data6 <- read.csv(file="6.csv", header=TRUE, sep=",")
data7 <- read.csv(file="7.csv", header=TRUE, sep=",")
data8 <- read.csv(file="8.csv", header=TRUE, sep=",")
data9 <- read.csv(file="9.csv", header=TRUE, sep=",")
data10 <- read.csv(file="10.csv", header=TRUE, sep=",")
data11 <- read.csv(file="11.csv", header=TRUE, sep=",")
data12 <- read.csv(file="12.csv", header=TRUE, sep=",")
data13 <- read.csv(file="13.csv", header=TRUE, sep=",")
data14 <- read.csv(file="14.csv", header=TRUE, sep=",")

#3
data3$Date <- as.POSIXct(data3$Date)
data3.toPlot <- data3
data3.toPlot$TimeDiff <- data3.toPlot$Date - data3.toPlot$Date[1]
data3.toPlot$TimeDiffValue <- as.numeric(data3.toPlot$TimeDiff)
data3.toPlot$Power <- as.double(-(data3.toPlot$Current/1000) * data3.toPlot$Voltage/1000)
data3.toPlot$Velocity <- sqrt(data3.toPlot$VelocityX^2 + data3.toPlot$VelocityY^2 + data3.toPlot$VelocityZ^2)
data3.toPlotFinal <- data3.toPlot[data3.toPlot$TimeDiffValue >= 21 & data3.toPlot$TimeDiffValue <= 23,]
data3.toPlotFinal$Mean <- mean(data3.toPlotFinal$Power)
data3.toPlotFinal$TimeDiffValueFinal <- data3.toPlotFinal$Date - data3.toPlotFinal$Date[1]

#4
data4$Date <- as.POSIXct(data4$Date)
data4.toPlot <- data4
data4.toPlot$TimeDiff <- data4.toPlot$Date - data4.toPlot$Date[1]
data4.toPlot$TimeDiffValue <- as.numeric(data4.toPlot$TimeDiff)
data4.toPlot$Power <- as.double(-(data4.toPlot$Current/1000) * data4.toPlot$Voltage/1000)
data4.toPlot$Velocity <- sqrt(data4.toPlot$VelocityX^2 + data4.toPlot$VelocityY^2 + data4.toPlot$VelocityZ^2)
data4.toPlotFinal <- data4.toPlot[data4.toPlot$TimeDiffValue >= 17 & data4.toPlot$TimeDiffValue <= 20,]
data4.toPlotFinal$Mean <- mean(data4.toPlotFinal$Power)
data4.toPlotFinal$TimeDiffValueFinal <- data4.toPlotFinal$Date - data4.toPlotFinal$Date[1]

#5
data5$Date <- as.POSIXct(data5$Date)
data5.toPlot <- data5
data5.toPlot$TimeDiff <- data5.toPlot$Date - data5.toPlot$Date[1]
data5.toPlot$TimeDiffValue <- as.numeric(data5.toPlot$TimeDiff)
data5.toPlot$Power <- as.double(-(data5.toPlot$Current/1000) * data5.toPlot$Voltage/1000)
data5.toPlot$Velocity <- sqrt(data5.toPlot$VelocityX^2 + data5.toPlot$VelocityY^2 + data5.toPlot$VelocityZ^2)
data5.toPlotFinal <- data5.toPlot[data5.toPlot$TimeDiffValue >= 18 & data5.toPlot$TimeDiffValue <= 21,]
data5.toPlotFinal$Mean <- mean(data5.toPlotFinal$Power)
data5.toPlotFinal$TimeDiffValueFinal <- data5.toPlotFinal$Date - data5.toPlotFinal$Date[1]

#6
data6$Date <- as.POSIXct(data6$Date)
data6.toPlot <- data6
data6.toPlot$TimeDiff <- data6.toPlot$Date - data6.toPlot$Date[1]
data6.toPlot$TimeDiffValue <- as.numeric(data6.toPlot$TimeDiff)
data6.toPlot$Power <- as.double(-(data6.toPlot$Current/1000) * data6.toPlot$Voltage/1000)
data6.toPlot$Velocity <- sqrt(data6.toPlot$VelocityX^2 + data6.toPlot$VelocityY^2 + data6.toPlot$VelocityZ^2)
data6.toPlotFinal <- data6.toPlot[data6.toPlot$TimeDiffValue >= 18 & data6.toPlot$TimeDiffValue <= 22,]
data6.toPlotFinal$Mean <- mean(data6.toPlotFinal$Power)
data6.toPlotFinal$TimeDiffValueFinal <- data6.toPlotFinal$Date - data6.toPlotFinal$Date[1]

#7
data7$Date <- as.POSIXct(data7$Date)
data7.toPlot <- data7
data7.toPlot$TimeDiff <- data7.toPlot$Date - data7.toPlot$Date[1]
data7.toPlot$TimeDiffValue <- as.numeric(data7.toPlot$TimeDiff)
data7.toPlot$Power <- as.double(-(data7.toPlot$Current/1000) * data7.toPlot$Voltage/1000)
data7.toPlot$Velocity <- sqrt(data7.toPlot$VelocityX^2 + data7.toPlot$VelocityY^2 + data7.toPlot$VelocityZ^2)
data7.toPlotFinal <- data7.toPlot[data7.toPlot$TimeDiffValue >= 21 & data7.toPlot$TimeDiffValue <= 25,]
data7.toPlotFinal$Mean <- mean(data7.toPlotFinal$Power)
data7.toPlotFinal$TimeDiffValueFinal <- data7.toPlotFinal$Date - data7.toPlotFinal$Date[1]

#8
data8$Date <- as.POSIXct(data8$Date)
data8.toPlot <- data8
data8.toPlot$TimeDiff <- data8.toPlot$Date - data8.toPlot$Date[1]
data8.toPlot$TimeDiffValue <- as.numeric(data8.toPlot$TimeDiff)
data8.toPlot$Power <- as.double(-(data8.toPlot$Current/1000) * data8.toPlot$Voltage/1000)
data8.toPlot$Velocity <- sqrt(data8.toPlot$VelocityX^2 + data8.toPlot$VelocityY^2 + data8.toPlot$VelocityZ^2)
data8.toPlotFinal <- data8.toPlot[data8.toPlot$TimeDiffValue >= 19 & data8.toPlot$TimeDiffValue <= 24,]
data8.toPlotFinal$Mean <- mean(data8.toPlotFinal$Power)
data8.toPlotFinal$TimeDiffValueFinal <- data8.toPlotFinal$Date - data8.toPlotFinal$Date[1]

#9
data9$Date <- as.POSIXct(data9$Date)
data9.toPlot <- data9
data9.toPlot$TimeDiff <- data9.toPlot$Date - data9.toPlot$Date[1]
data9.toPlot$TimeDiffValue <- as.numeric(data9.toPlot$TimeDiff)
data9.toPlot$Power <- as.double(-(data9.toPlot$Current/1000) * data9.toPlot$Voltage/1000)
data9.toPlot$Velocity <- sqrt(data9.toPlot$VelocityX^2 + data9.toPlot$VelocityY^2 + data9.toPlot$VelocityZ^2)
data9.toPlotFinal <- data9.toPlot[data9.toPlot$TimeDiffValue >= 18 & data9.toPlot$TimeDiffValue <= 24,]
data9.toPlotFinal$Mean <- mean(data9.toPlotFinal$Power)
data9.toPlotFinal$TimeDiffValueFinal <- data9.toPlotFinal$Date - data9.toPlotFinal$Date[1]

#10
data10$Date <- as.POSIXct(data10$Date)
data10.toPlot <- data10
data10.toPlot$TimeDiff <- data10.toPlot$Date - data10.toPlot$Date[1]
data10.toPlot$TimeDiffValue <- as.numeric(data10.toPlot$TimeDiff)
data10.toPlot$Power <- as.double(-(data10.toPlot$Current/1000) * data10.toPlot$Voltage/1000)
data10.toPlot$Velocity <- sqrt(data10.toPlot$VelocityX^2 + data10.toPlot$VelocityY^2 + data10.toPlot$VelocityZ^2)
data10.toPlotFinal <- data10.toPlot[data10.toPlot$TimeDiffValue >= 17 & data10.toPlot$TimeDiffValue <= 22,]
data10.toPlotFinal$Mean <- mean(data10.toPlotFinal$Power)
data10.toPlotFinal$TimeDiffValueFinal <- data10.toPlotFinal$Date - data10.toPlotFinal$Date[1]

#11
data11$Date <- as.POSIXct(data11$Date)
data11.toPlot <- data11
data11.toPlot$TimeDiff <- data11.toPlot$Date - data11.toPlot$Date[1]
data11.toPlot$TimeDiffValue <- as.numeric(data11.toPlot$TimeDiff)
data11.toPlot$Power <- as.double(-(data11.toPlot$Current/1000) * data11.toPlot$Voltage/1000)
data11.toPlot$Velocity <- sqrt(data11.toPlot$VelocityX^2 + data11.toPlot$VelocityY^2 + data11.toPlot$VelocityZ^2)
data11.toPlotFinal <- data11.toPlot[data11.toPlot$TimeDiffValue >= 18 & data11.toPlot$TimeDiffValue <= 24,]
data11.toPlotFinal$Mean <- mean(data11.toPlotFinal$Power)
data11.toPlotFinal$TimeDiffValueFinal <- data11.toPlotFinal$Date - data11.toPlotFinal$Date[1]

#12
data12$Date <- as.POSIXct(data12$Date)
data12.toPlot <- data12
data12.toPlot$TimeDiff <- data12.toPlot$Date - data12.toPlot$Date[1]
data12.toPlot$TimeDiffValue <- as.numeric(data12.toPlot$TimeDiff)
data12.toPlot$Power <- as.double(-(data12.toPlot$Current/1000) * data12.toPlot$Voltage/1000)
data12.toPlot$Velocity <- sqrt(data12.toPlot$VelocityX^2 + data12.toPlot$VelocityY^2 + data12.toPlot$VelocityZ^2)
data12.toPlotFinal <- data12.toPlot[data12.toPlot$TimeDiffValue >= 18 & data12.toPlot$TimeDiffValue <= 26,]
data12.toPlotFinal$Mean <- mean(data12.toPlotFinal$Power)
data12.toPlotFinal$TimeDiffValueFinal <- data12.toPlotFinal$Date - data12.toPlotFinal$Date[1]

#13
data13$Date <- as.POSIXct(data13$Date)
data13.toPlot <- data13
data13.toPlot$TimeDiff <- data13.toPlot$Date - data13.toPlot$Date[1]
data13.toPlot$TimeDiffValue <- as.numeric(data13.toPlot$TimeDiff)
data13.toPlot$Power <- as.double(-(data13.toPlot$Current/1000) * data13.toPlot$Voltage/1000)
data13.toPlot$Velocity <- sqrt(data13.toPlot$VelocityX^2 + data13.toPlot$VelocityY^2 + data13.toPlot$VelocityZ^2)
data13.toPlotFinal <- data13.toPlot[data13.toPlot$TimeDiffValue >= 18 & data13.toPlot$TimeDiffValue <= 27,]
data13.toPlotFinal$Mean <- mean(data13.toPlotFinal$Power)
data13.toPlotFinal$TimeDiffValueFinal <- data13.toPlotFinal$Date - data13.toPlotFinal$Date[1]

#14
data14$Date <- as.POSIXct(data14$Date)
data14.toPlot <- data14
data14.toPlot$TimeDiff <- data14.toPlot$Date - data14.toPlot$Date[1]
data14.toPlot$TimeDiffValue <- as.numeric(data14.toPlot$TimeDiff)
data14.toPlot$Power <- as.double(-(data14.toPlot$Current/1000) * data14.toPlot$Voltage/1000)
data14.toPlot$Velocity <- sqrt(data14.toPlot$VelocityX^2 + data14.toPlot$VelocityY^2 + data14.toPlot$VelocityZ^2)
data14.toPlotFinal <- data14.toPlot[data14.toPlot$TimeDiffValue >= 18 & data14.toPlot$TimeDiffValue <= 28,]
data14.toPlotFinal$Mean <- mean(data14.toPlotFinal$Power)
data14.toPlotFinal$TimeDiffValueFinal <- data14.toPlotFinal$Date - data14.toPlotFinal$Date[1]

data.toPlot <- rbind(data3.toPlotFinal, data4.toPlotFinal, data5.toPlotFinal, data6.toPlotFinal, data7.toPlotFinal, data8.toPlotFinal, data9.toPlotFinal, data10.toPlotFinal, data11.toPlotFinal, data12.toPlotFinal, data13.toPlotFinal, data14.toPlotFinal)
#data.toPlot$TotalTimeDiff <- as.numeric(1:nrow(data.toPlot)) 

ppi <- 200
png(file=paste("AcclerationAndTargetVelocity", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

plot(y=data.toPlot$Mean, x=data.toPlot$VelocitySolid,type="p",col="black", lwd="1", xlab="Target Velocity (m/s)", ylab="Energy (Watts/s)", main="Energy consumed during acclerating")
fit <- lm(data.toPlot$Mean ~ poly(data.toPlot$VelocitySolid, 4, raw=TRUE))
points(data.toPlot$VelocitySolid, predict(fit), type="l", col="red", lwd=2)
#summary(fit)

dev.off()

