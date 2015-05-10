###############################################################################
# R script to read data and plot graphs, as requested for Course Project 1 in
# Coursera's Exploratory Data Analysis course
###############################################################################

#############################
# Aux function and data read
#############################

#Auxiliary class conversion function to transform the Date column
setAs("character","myDate", function(from){
  d <- as.Date(from, format="%d/%m/%Y")
  
  #result stored on global scopt, to be used as date for time conversion
  x <<- d
  
  d
})

#Auxiliary class conversion function to transform the Time column
setAs("character","myTime", function(from) {
  z <- strptime(from, format="%H:%M:%S")
  t <-strptime(paste(as.character(x),
                     formatC(z$hour, width=2, flag="0"),":",
                     formatC(z$min, width=2, flag="0"),":",
                     formatC(z$sec, width=2, flag="0")),
               format="%Y-%m-%d %H : %M : %S")
  as.POSIXct(t)
})

#avoid warnings 
setClass('myDate')
setClass('myTime')


# Get data from the network, unzip, and pre-process before loading it in R 

# if using MS Windows, the shell script might fail...
# Use a Git Bash or Cygwin console to create the secondary data file
# using Unix command line tools:
#
# head -n 1 household_power_consumption.txt > power.txt
# grep "^[1|2]/2/2007" household_power_consumption.txt >> power.txt
#

if (!file.exists("power.txt")){
  if(!file.exists("household_power_consumption.txt")){
    if(!file.exists("household_power_consumption.zip")){
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                    "household_power_consumption.zip",
                    method="curl")
      # "internal" dows not support https
    }
    unzip("household_power_consumption.zip")
  }
  system("/bin/sh subset_data_file.sh")
}

power <- read.table("power.txt",sep=";", na.strings="?", header=TRUE,
                    colClasses = c('myDate','myTime','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


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
