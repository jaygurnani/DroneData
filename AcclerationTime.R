require(splines) #thx @Chase for the notice

# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")

# Read the data
data <- read.csv(file="14.csv", header=TRUE, sep=",")

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data[data$Battery > 18,]

# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

# Since TimeDiff is a time/date object, convert it to a numeric and store this as an extra column in data frame
data.toPlot$TimeDiffValue <- as.numeric(data.toPlot$TimeDiff)

# Multiple current and voltage to get Power
data.toPlot$Power <- as.double(-(data.toPlot$Current/1000) * data.toPlot$Voltage/1000)

#Get Mangnitude of Velocity
data.toPlot$Velocity <- sqrt(data.toPlot$VelocityX^2 + data.toPlot$VelocityY^2 + data.toPlot$VelocityZ^2)

#Remove extra data
#data.toPlot <- data.toPlot[data.toPlot$TimeDiffValue > 19 & data.toPlot$TimeDiffValue < 25,]

dY <- diff(data.toPlot$Velocity)/diff(data.toPlot$TimeDiffValue)  # the derivative of your function
dX <- rowMeans(embed(data.toPlot$TimeDiffValue,2)) # centers the X values for plotting

ppi <- 200
png(file=paste("14Accleration", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

par(mar=c(5,5,2,2))
plot(y=abs(dY), x=dX,type="l",col="red", lwd="1", ylab=expression(~Accleration ~(m/s^{2})), xlab="Time (seconds)")

dev.off()