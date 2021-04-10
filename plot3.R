# Exploratory Data Analysis with R, Week 1, Project John Hopkins Coursera
# Plot #3
#-------------------------------------------------------------------------------------------
consumption         <- read.csv(file = "household_power_consumption.txt", sep=";", header=TRUE)           # load data
consumption_sub     <- subset(consumption, Date == "1/2/2007" | Date =="2/2/2007")                        # select data to two days V2, just learned ;-) 
sub1                <- as.numeric(consumption_sub$Sub_metering_1)                                         # numeric
sub2                <- as.numeric(consumption_sub$Sub_metering_2)                                         # numeric
sub3                <- as.numeric(consumption_sub$Sub_metering_3)                                         # numeric

datetime <- strptime(paste(consumption_sub$Date,consumption_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")      # date

png("plot3.png", width = 480, height = 480)                                                               # special size and png
plot(datetime, sub1, type="n", xlab="", ylab="Energy sub metering")
points(datetime, sub1, type="l", )               # plot data
points(datetime, sub2, type="l", col="red")                                                             # plot data
points(datetime, sub3, type="l", col="blue")                                                             # plot data
legend("topright", bty="o", lwd=2, col=c("black", "blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()                                                                                                 # end png !!
