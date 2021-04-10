# Exploratory Data Analysis with R, Week 1, Project John Hopkins Coursera
# 
# Information: 
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
#-------------------------------------------------------------------------------------------
consumption         <- read.csv(file = "household_power_consumption.txt", sep=";", header=TRUE)           # load data
# consumption_sel <- consumption %>% filter(Date == "1/2/2007" | Date =="2/2/2007")                       # select data to two days V1, old version
consumption_sub     <- subset(consumption, Date == "1/2/2007" | Date =="2/2/2007")                        # select data to two days V2, just learned ;-) 
globalactivepower <- as.numeric(consumption_sub$Global_active_power)                                      # numeric

png("plot1.png", width = 480, height = 480)                                                               # special size and png
hist(globalactivepower, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowats)") # plot data
dev.off()                                                                                                 # end png !!

