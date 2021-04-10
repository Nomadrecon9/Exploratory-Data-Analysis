# Exploratory Data Analysis with R, Week 1, Project John Hopkins Coursera
# Plot #2
#-------------------------------------------------------------------------------------------
consumption         <- read.csv(file = "household_power_consumption.txt", sep=";", header=TRUE)           # load data
consumption_sub     <- subset(consumption, Date == "1/2/2007" | Date =="2/2/2007")                        # select data to two days V2, just learned with subset;-) 
globalactivepower   <- as.numeric(consumption_sub$Global_active_power)                                    # numeric
datetime <- strptime(paste(consumption_sub$Date,consumption_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")      # date

png("plot2.png", width = 480, height = 480)                                                               # special size and png
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowats)")               # plot data
dev.off()                                                                                                 # end png !!
