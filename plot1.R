## Read in the entire power consumption file
all_power <- read.table("household_power_consumption.txt", 
                        header=TRUE, 
                        sep=";", 
                        na.strings="?", 
                        colClasses=c("character", "character", "numeric", "numeric", 
                                     "numeric", "numeric", "numeric", "numeric", "numeric"))

## Pull out just the 1st and 2nd of February to work with
feb_power <- all_power[all_power$Date == "1/2/2007" | all_power$Date=="2/2/2007",]

## Set up our output file
png(filename="plot1.png", width=480, height=480)

## Create a histogram of Global Active Power
hist(feb_power$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## Close the output device
dev.off()