source('GetProcessReadData.R')

#########
# Plot 4
#########
png("plot4.png",width=480,height=480)

# NOTE - added some explanatory labels not requested in the exercise, such as datetime in
# graphs in the first column, and remove underscores in graph(2,2) label
#
# No modifications to grapg panel layout

#4 graphs
par(mfcol=c(2,2))

#graph (1,1)
with(power,
     plot(Global_active_power ~ Time,
          type="l",
          ylab="Global Active Power",
          xlab="datetime")
)

# graph (2,1)
with(power, plot( Sub_metering_1 ~ Time, type="n", ylab="Energy Sub Metering", xlab="datetime"))
with(power, lines(Sub_metering_1 ~ Time, col="black"))
with(power, lines(Sub_metering_2 ~ Time, col="red"))
with(power, lines(Sub_metering_3 ~ Time, col="blue"))

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1,
       horiz=FALSE,
       bty="n")

# graph (1,2)
with(power,
     plot(Voltage ~ Time,
          type="l",
          xlab="datetime")
)

# graph(2,2)
with(power,
     plot(Global_reactive_power ~ Time,
          type="l",
          ylab="Global Reactive Power",
          xlab="datetime")
)
dev.off()
