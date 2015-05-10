source('GetProcessReadData.R')

#########
# Plot 3
#########
png("plot3.png",width=480,height=480)

with(power, plot( Sub_metering_1 ~ Time, type="n", ylab="Energy sub metering", xlab=""))
with(power, lines(Sub_metering_1 ~ Time, col="black"))
with(power, lines(Sub_metering_2 ~ Time, col="red"))
with(power, lines(Sub_metering_3 ~ Time, col="blue"))

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1,
       horiz=FALSE)

dev.off()
