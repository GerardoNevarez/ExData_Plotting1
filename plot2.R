source('GetProcessReadData.R')

#########
# Plot 2
#########
png("plot2.png",width=480,height=480)
with(power,
     plot(Global_active_power ~ Time,
          type="l",
          ylab="Global Active Power (kilowatts)")
)
dev.off()







