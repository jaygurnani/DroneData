# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data0 <- read.csv(file="pitch30.csv", header=TRUE, sep=",")
data3 <- read.csv(file="pitch31.csv", header=TRUE, sep=",")
data4 <- read.csv(file="pitch32.csv", header=TRUE, sep=",")
data5 <- read.csv(file="pitch33.csv", header=TRUE, sep=",")
data6 <- read.csv(file="pitch23.csv", header=TRUE, sep=",")
data7 <- read.csv(file="pitch13.csv", header=TRUE, sep=",")
data8 <- read.csv(file="pitch03.csv", header=TRUE, sep=",")
data9 <- read.csv(file="pitch-13.csv", header=TRUE, sep=",")
data10 <- read.csv(file="pitch-23.csv", header=TRUE, sep=",")
data11 <- read.csv(file="pitch-33.csv", header=TRUE, sep=",")
data12 <- read.csv(file="pitch-32.csv", header=TRUE, sep=",")
data13 <- read.csv(file="pitch-31.csv", header=TRUE, sep=",")
data14 <- read.csv(file="pitch-30.csv", header=TRUE, sep=",")

#0
data0$Date <- as.POSIXct(data0$Date)
data0.toPlot <- data0
data0.toPlot$TimeDiff <- data0.toPlot$Date - data0.toPlot$Date[1]
data0.toPlot$TimeDiffValue <- as.numeric(data0.toPlot$TimeDiff)
data0.toPlot$Power <- as.double(-(data0.toPlot$Current/1000) * data0.toPlot$Voltage/1000)
data0.toPlot$Pitch = 3
data0.toPlot$Roll = 0
data0.toPlot$Velocity <- sqrt(data0.toPlot$VelocityX^2 + data0.toPlot$VelocityY^2 + data0.toPlot$VelocityZ^2)
data0.toPlot$Degree = (180 * atan(data0.toPlot$Roll/data0.toPlot$Pitch)) / pi
data0.toPlot$Mean <- mean(data0.toPlot$Power)

#3
data3$Date <- as.POSIXct(data3$Date)
data3.toPlot <- data3
data3.toPlot$TimeDiff <- data3.toPlot$Date - data3.toPlot$Date[1]
data3.toPlot$TimeDiffValue <- as.numeric(data3.toPlot$TimeDiff)
data3.toPlot$Power <- as.double(-(data3.toPlot$Current/1000) * data3.toPlot$Voltage/1000)
data3.toPlot$Pitch = 3
data3.toPlot$Roll = 1
data3.toPlot$Velocity <- sqrt(data3.toPlot$VelocityX^2 + data3.toPlot$VelocityY^2 + data3.toPlot$VelocityZ^2)
data3.toPlot$Degree = (180 * atan(data3.toPlot$Roll/data3.toPlot$Pitch)) / pi
data3.toPlot$Mean <- mean(data3.toPlot$Power)

#4
data4$Date <- as.POSIXct(data4$Date)
data4.toPlot <- data4
data4.toPlot$TimeDiff <- data4.toPlot$Date - data4.toPlot$Date[1]
data4.toPlot$TimeDiffValue <- as.numeric(data4.toPlot$TimeDiff)
data4.toPlot$Power <- as.double(-(data4.toPlot$Current/1000) * data4.toPlot$Voltage/1000)
data4.toPlot$Pitch = 3
data4.toPlot$Roll = 2
data4.toPlot$Velocity <- sqrt(data4.toPlot$VelocityX^2 + data4.toPlot$VelocityY^2 + data4.toPlot$VelocityZ^2)
data4.toPlot$Degree = (180 * atan(data4.toPlot$Roll/data4.toPlot$Pitch)) / pi
data4.toPlot$Mean <- mean(data4.toPlot$Power)

#5
data5$Date <- as.POSIXct(data5$Date)
data5.toPlot <- data5
data5.toPlot$TimeDiff <- data5.toPlot$Date - data5.toPlot$Date[1]
data5.toPlot$TimeDiffValue <- as.numeric(data5.toPlot$TimeDiff)
data5.toPlot$Power <- as.double(-(data5.toPlot$Current/1000) * data5.toPlot$Voltage/1000)
data5.toPlot$Pitch = 3
data5.toPlot$Roll = 3
data5.toPlot$Velocity <- sqrt(data5.toPlot$VelocityX^2 + data5.toPlot$VelocityY^2 + data5.toPlot$VelocityZ^2)
data5.toPlot$Degree = (180 * atan(data5.toPlot$Roll/data5.toPlot$Pitch)) / pi
data5.toPlot$Mean <- mean(data5.toPlot$Power)

#6
data6$Date <- as.POSIXct(data6$Date)
data6.toPlot <- data6
data6.toPlot$TimeDiff <- data6.toPlot$Date - data6.toPlot$Date[1]
data6.toPlot$TimeDiffValue <- as.numeric(data6.toPlot$TimeDiff)
data6.toPlot$Power <- as.double(-(data6.toPlot$Current/1000) * data6.toPlot$Voltage/1000)
data6.toPlot$Pitch = 2
data6.toPlot$Roll = 3
data6.toPlot$Velocity <- sqrt(data6.toPlot$VelocityX^2 + data6.toPlot$VelocityY^2 + data6.toPlot$VelocityZ^2)
data6.toPlot$Degree = (180 * atan(data6.toPlot$Roll/data6.toPlot$Pitch)) / pi
data6.toPlot$Mean <- mean(data6.toPlot$Power)

#7
data7$Date <- as.POSIXct(data7$Date)
data7.toPlot <- data7
data7.toPlot$TimeDiff <- data7.toPlot$Date - data7.toPlot$Date[1]
data7.toPlot$TimeDiffValue <- as.numeric(data7.toPlot$TimeDiff)
data7.toPlot$Power <- as.double(-(data7.toPlot$Current/1000) * data7.toPlot$Voltage/1000)
data7.toPlot$Pitch = 1
data7.toPlot$Roll = 3
data7.toPlot$Velocity <- sqrt(data7.toPlot$VelocityX^2 + data7.toPlot$VelocityY^2 + data7.toPlot$VelocityZ^2)
data7.toPlot$Degree = (180 * atan(data7.toPlot$Roll/data7.toPlot$Pitch)) / pi
data7.toPlot$Mean <- mean(data7.toPlot$Power)

#8
data8$Date <- as.POSIXct(data8$Date)
data8.toPlot <- data8
data8.toPlot$TimeDiff <- data8.toPlot$Date - data8.toPlot$Date[1]
data8.toPlot$TimeDiffValue <- as.numeric(data8.toPlot$TimeDiff)
data8.toPlot$Power <- as.double(-(data8.toPlot$Current/1000) * data8.toPlot$Voltage/1000)
data8.toPlot$Pitch = 0
data8.toPlot$Roll = 3
data8.toPlot$Velocity <- sqrt(data8.toPlot$VelocityX^2 + data8.toPlot$VelocityY^2 + data8.toPlot$VelocityZ^2)
data8.toPlot$Degree = (180 * atan(data8.toPlot$Roll/data8.toPlot$Pitch)) / pi
data8.toPlot$Mean <- mean(data8.toPlot$Power)

#9
data9$Date <- as.POSIXct(data9$Date)
data9.toPlot <- data9
data9.toPlot$TimeDiff <- data9.toPlot$Date - data9.toPlot$Date[1]
data9.toPlot$TimeDiffValue <- as.numeric(data9.toPlot$TimeDiff)
data9.toPlot$Power <- as.double(-(data9.toPlot$Current/1000) * data9.toPlot$Voltage/1000)
data9.toPlot$Pitch = 1
data9.toPlot$Roll = 3
data9.toPlot$Velocity <- sqrt(data9.toPlot$VelocityX^2 + data9.toPlot$VelocityY^2 + data9.toPlot$VelocityZ^2)
data9.toPlot$Degree = ((180 * atan(data9.toPlot$Pitch/data9.toPlot$Roll)) / pi) + 90
data9.toPlot$Mean <- mean(data9.toPlot$Power)

#10
data10$Date <- as.POSIXct(data10$Date)
data10.toPlot <- data10
data10.toPlot$TimeDiff <- data10.toPlot$Date - data10.toPlot$Date[1]
data10.toPlot$TimeDiffValue <- as.numeric(data10.toPlot$TimeDiff)
data10.toPlot$Power <- as.double(-(data10.toPlot$Current/1000) * data10.toPlot$Voltage/1000)
data10.toPlot$Pitch = 2
data10.toPlot$Roll = 3
data10.toPlot$Velocity <- sqrt(data10.toPlot$VelocityX^2 + data10.toPlot$VelocityY^2 + data10.toPlot$VelocityZ^2)
data10.toPlot$Degree = ((180 * atan(data10.toPlot$Pitch/data10.toPlot$Roll)) / pi) + 90
data10.toPlot$Mean <- mean(data10.toPlot$Power)

#11
data11$Date <- as.POSIXct(data11$Date)
data11.toPlot <- data11
data11.toPlot$TimeDiff <- data11.toPlot$Date - data11.toPlot$Date[1]
data11.toPlot$TimeDiffValue <- as.numeric(data11.toPlot$TimeDiff)
data11.toPlot$Power <- as.double(-(data11.toPlot$Current/1000) * data11.toPlot$Voltage/1000)
data11.toPlot$Pitch = 3
data11.toPlot$Roll = 3
data11.toPlot$Velocity <- sqrt(data11.toPlot$VelocityX^2 + data11.toPlot$VelocityY^2 + data11.toPlot$VelocityZ^2)
data11.toPlot$Degree = ((180 * atan(data11.toPlot$Pitch/data11.toPlot$Roll)) / pi) + 90
data11.toPlot$Mean <- mean(data11.toPlot$Power)

#12
data12$Date <- as.POSIXct(data12$Date)
data12.toPlot <- data12
data12.toPlot$TimeDiff <- data12.toPlot$Date - data12.toPlot$Date[1]
data12.toPlot$TimeDiffValue <- as.numeric(data12.toPlot$TimeDiff)
data12.toPlot$Power <- as.double(-(data12.toPlot$Current/1000) * data12.toPlot$Voltage/1000)
data12.toPlot$Pitch = 3
data12.toPlot$Roll = 2
data12.toPlot$Velocity <- sqrt(data12.toPlot$VelocityX^2 + data12.toPlot$VelocityY^2 + data12.toPlot$VelocityZ^2)
data12.toPlot$Degree = ((180 * atan(data12.toPlot$Pitch/data12.toPlot$Roll)) / pi) + 90
data12.toPlot$Mean <- mean(data12.toPlot$Power)

#13
data13$Date <- as.POSIXct(data13$Date)
data13.toPlot <- data13
data13.toPlot$TimeDiff <- data13.toPlot$Date - data13.toPlot$Date[1]
data13.toPlot$TimeDiffValue <- as.numeric(data13.toPlot$TimeDiff)
data13.toPlot$Power <- as.double(-(data13.toPlot$Current/1000) * data13.toPlot$Voltage/1000)
data13.toPlot$Pitch = 3
data13.toPlot$Roll = 1
data13.toPlot$Velocity <- sqrt(data13.toPlot$VelocityX^2 + data13.toPlot$VelocityY^2 + data13.toPlot$VelocityZ^2)
data13.toPlot$Degree = ((180 * atan(data13.toPlot$Pitch/data13.toPlot$Roll)) / pi) + 90
data13.toPlot$Mean <- mean(data13.toPlot$Power)

#14
data14$Date <- as.POSIXct(data14$Date)
data14.toPlot <- data14
data14.toPlot$TimeDiff <- data14.toPlot$Date - data14.toPlot$Date[1]
data14.toPlot$TimeDiffValue <- as.numeric(data14.toPlot$TimeDiff)
data14.toPlot$Power <- as.double(-(data14.toPlot$Current/1000) * data14.toPlot$Voltage/1000)
data14.toPlot$Pitch = 3
data14.toPlot$Roll = 0
data14.toPlot$Degree = 180
data14.toPlot$Velocity <- sqrt(data14.toPlot$VelocityX^2 + data14.toPlot$VelocityY^2 + data14.toPlot$VelocityZ^2)
data14.toPlot$Mean <- mean(data14.toPlot$Power)

# Extract the data from column name to plot
#data.toPlot <- rbind(data0.toPlot, data3.toPlot, data4.toPlot, data5.toPlot, data6.toPlot, data7.toPlot, data8.toPlot, data9.toPlot, data10.toPlot, data11.toPlot, data12.toPlot, data13.toPlot, data14.toPlot)
data.toPlot = data5.toPlot

#write.csv(data.toPlotFinal, file="toPlotFinal")
#ppi <- 200
#png(file=paste("PitchBoxPlot", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#Final
plot(y=data4.toPlot$Velocity, x=data4.toPlot$TimeDiffValue, main="Power vs Degree of change", xlab="Time", ylab="Velocity")
#dev.off()

