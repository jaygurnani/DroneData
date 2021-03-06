# Set the working directory
setwd("/Users/mac/Desktop/Programming/COMP9596//DroneData")
require(splines) #thx @Chase for the notice

rad2deg <- function(rad) {(rad * 180) / (pi)}

# Read the data
data1 <- read.csv(file="freq1.csv", header=TRUE, sep=",")
data2 <- read.csv(file="freq2.csv", header=TRUE, sep=",")
data3 <- read.csv(file="freq3.csv", header=TRUE, sep=",")
data4 <- read.csv(file="freq4.csv", header=TRUE, sep=",")
data5 <- read.csv(file="freq5.csv", header=TRUE, sep=",")
data6 <- read.csv(file="freq6.csv", header=TRUE, sep=",")
data7 <- read.csv(file="freq7.csv", header=TRUE, sep=",")
data8 <- read.csv(file="freq8.csv", header=TRUE, sep=",")
data9 <- read.csv(file="freq9.csv", header=TRUE, sep=",")

data <- rbind(data1, data2, data3, data4, data5, data6, data7, data8, data9)

# Convert date column to Date object
data$Date <- as.POSIXct(data$Date)

# Extract the data from column name to plot
data.toPlot <- data

# Calculate the difference of each time point to the first (in seconds)
data.toPlot$TimeDiff <- data.toPlot$Date - data.toPlot$Date[1]

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


t0 = data.toPlot[data.toPlot$Method == '5',]$TanDirection
t1 = data.toPlot[data.toPlot$Method == '4',]$TanDirection
t2 = data.toPlot[data.toPlot$Method == '3',]$TanDirection
t3 = data.toPlot[data.toPlot$Method == '2',]$TanDirection
t4 = data.toPlot[data.toPlot$Method == '1',]$TanDirection
t5 = data.toPlot[data.toPlot$Method == '0.75',]$TanDirection
t6 = data.toPlot[data.toPlot$Method == '0.5',]$TanDirection
t7 = data.toPlot[data.toPlot$Method == '0.25',]$TanDirection
t8 = data.toPlot[data.toPlot$Method == '0.1',]$TanDirection


r0 = max(t0) - min(t0)
r1 = max(t1) - min(t1)
r2 = max(t2) - min(t2)
r3 = max(t3) - min(t3)
r4 = max(t4) - min(t4)
r5 = max(t5) - min(t5)
r6 = max(t6) - min(t6)
r7 = max(t7) - min(t7)
r8 = max(t8) - min(t8)


#dY <- diff(data.toPlot$Velocity)/diff(data.toPlot$TimeDiffValue)  # the derivative of your function
#dX <- rowMeans(embed(data.toPlot$TimeDiffValue,2)) # centers the X values for plotting

ppi <- 200
#png(file=paste("10MsAngles", ".png", sep=""), height=7*ppi, width=9*ppi, res=ppi)

#write.csv(data.toPlotFinal, file="FirstRev.csv")
y2 = c(r1, r2, r3, r4, r5, r6, r7, r8)
x2 = c('4', '3','2','1', '0.75', '0.5', '0.25', '0.1')

plot(y=y2, x=x2, xlim=c(4,0), type="p",col="black", lwd="1", ylab="Degrees turned", xlab="Interval Times (in seconds)", ylim=c(0, 30),
     main="Effect of turning order on speed for different order frequencies - 10 m/s Initial speed")
axis(1, at = seq(.25, .75, .25), labels = seq(.25, .75, .25), las=2)
abline(a=20, b=0, lty =3)

legend("topleft", legend=c("Angle instructed to turn"), bty="n", lty=3, lwd=1)

#dev.off()
print(r1)
print(r2)
print(r3)
print(r4)
print(r5)
print(r6)
print(r7)
print(r8)
