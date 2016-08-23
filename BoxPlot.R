# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data3 <- read.csv(file="3.csv", header=TRUE, sep=",")
data4 <- read.csv(file="4.csv", header=TRUE, sep=",")
data5 <- read.csv(file="5.csv", header=TRUE, sep=",")
data6 <- read.csv(file="6.csv", header=TRUE, sep=",")

# Extract the data from column name to plot
data.toPlot <- rbind(data3, data4, data5, data6)

# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)
#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)

data.toPlotFinal <- data.toPlot[(data.toPlot$Velocity > 2.85 & data.toPlot$Velocity < 3.15) | 
                                  (data.toPlot$Velocity > 3.80 & data.toPlot$Velocity < 4.20) |
                                  (data.toPlot$Velocity > 4.75 & data.toPlot$Velocity < 5.25) |
                                  (data.toPlot$Velocity > 5.70 & data.toPlot$Velocity < 6.30),]

ppi <- 200
png(file=paste("FinalBoxPlot", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#Final
boxplot(data.toPlot$Power~data.toPlot$VelocitySolid,data=data.toPlot, main="Power vs Speed Box Plot test", xlab="Velocity (m/s)", ylab="Power in Watts")

dev.off()
