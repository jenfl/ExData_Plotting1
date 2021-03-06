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
png(filename="plot3.png", width=480, height=480)

with(feb_power, {
    ## Open a plot but don't draw anything
    plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    ## Add in different color lines for different sub meters
    lines(DateTime, Sub_metering_1, col="black")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
})

## Legend
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close the output file
dev.off()