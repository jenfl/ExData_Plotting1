## Read in the entire power consumption file
all_power <- read.table("household_power_consumption.txt", 
                        header=TRUE, 
                        sep=";", 
                        na.strings="?", 
                        colClasses=c("character", "character", "numeric", "numeric", 
                                     "numeric", "numeric", "numeric", "numeric", "numeric"))

## Pull out just the 1st and 2nd of February to work with
feb_power <- all_power[all_power$Date == "1/2/2007" | all_power$Date=="2/2/2007",]

## Convert our Date and Time columns to a new DateTime object column
feb_power$DateTime <- strptime(paste(feb_power$Date, feb_power$Time), 
                               format="%d/%m/%Y %H:%M:%S")

## Open the output file
png(filename="plot2.png", width=480, height=480)

## Draw our line plot
with(feb_power, 
     plot(DateTime, Global_active_power, 
          type="l", xlab="", ylab="Global Active Power (kilowatts)"))

## Close the output file
dev.off()