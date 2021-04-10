# Exploratory Data Analysis with R, Week 1, Project John Hopkins Coursera
# Plot #4
#-------------------------------------------------------------------------------------------
consumption         <- read.csv(file = "household_power_consumption.txt", sep=";", header=TRUE)           # load data
consumption_sub     <- subset(consumption, Date == "1/2/2007" | Date =="2/2/2007")                        # select data to two days V2, just learned ;-) 
sub1                <- as.numeric(consumption_sub$Sub_metering_1)                                         # numeric
sub2                <- as.numeric(consumption_sub$Sub_metering_2)                                         # numeric
sub3                <- as.numeric(consumption_sub$Sub_metering_3)                                         # numeric

globalactivepower   <- as.numeric(consumption_sub$Global_active_power)                                    # numeric
voltage             <- as.numeric(consumption_sub$Voltage)                                                # numeric
globalreactivepower <- as.numeric(consumption_sub$Global_reactive_power)                                  # numeric
datetime            <- strptime(paste(consumption_sub$Date,consumption_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


# if(dev.cur() == 1) dev.new()                                                                             # for testing with Output in Plots not PNG
png("plot4.png")                                                                                         

par(mfrow = c(2, 2))
#1
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power")                          # plot data #1

#2
plot(datetime, voltage, type="l", ylab="Voltage")                                                         # plot data #2

#3
plot(datetime, sub1, type="n", xlab="", ylab="Energy sub metering")                                       # plot data #3
points(datetime, sub1, type="l", )               
points(datetime, sub2, type="l", col="red")                                                              
points(datetime, sub3, type="l", col="blue")                                                             
legend("topright", bty="n", lwd=2, col=c("black", "blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) # clear boxframe !

#4
plot(datetime, globalreactivepower, type="l", ylab="Global_reactive_power")                               # plot data #4

dev.off()                                                                                                 # end png !!
