# First clean your memory
rm(list=ls()) # this can help!

#reading data
# setwd (yourdirectory)
data<- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting 
sub<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 


# Changing the class 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

# Creating a new column in dataset named "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# plot3
png("plot3.png", width = 480, height = 480)
plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off() #Don't forget this!
