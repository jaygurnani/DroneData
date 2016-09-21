# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice

# Read the data
data <- read.csv(file="thirdRun.csv", header=TRUE, sep=",")

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

ppi <- 200
png(file=paste("ThirdExperiement", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
plot(y=data.toPlot$Velocity, x=data.toPlot$TimeDiffValue,type="l",col="black", lwd="1", ylab="Speed (m/s)", xlab="Time in Seconds")
points(x=5.04200005531311, y=9.7046379, pch=1)
points(x=7.01699995994568, y=7.3661388, pch=2)
points(x=9.01799988746643, y=4.7391983, pch=3)
points(x=11.0299999713898, y=3.0626786, pch=4)
points(x=13.0269999504089, y=5.1874850, pch=5) 

legend("topleft", legend=c("55 Degrees", "60 Degrees", "65 Degrees", "70 Degrees", "75 Degrees"), bty="n", pch=1:5, lty=1, lwd=1)

dev.off()
