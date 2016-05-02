# First clean your memory
rm(list=ls()) # this can help!!

#reading data
# setwd (yourdirectory)
data<- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# dim(elc) a big data?
# Subsetting 
sub<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# plot1
png("plot1.png", width=480, height= 480)
hist(sub$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off() #Don't forget this!
