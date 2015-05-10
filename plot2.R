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

# Review if a subset of the data file exists, and read the data.
# Create the secondary file using Unix command line tools:
#
# head -n 1 household_power_consumption.txt > power.txt
# grep "^[1|2]/2/2007" household_power_consumption.txt >> power.txt
#
# Windows Users -> use a Git Bash console 

if (file.exists("power.txt")){
    power <- read.table("power.txt",sep=";", na.strings="?", header=TRUE,
        colClasses = c('myDate','myTime','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
} else {
    stop("Please subset the data file executing \"sh subset_data_file.sh\" using Unix/Git Bash  console")
}

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







