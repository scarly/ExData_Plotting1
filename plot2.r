# First clean your memory
rm(list=ls()) # this can help!

#reading data
# setwd (yourdirectory)
data<- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting 
sub<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# Changing the class  
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# Creating the plot2:
png("plot2.png", width=480, height= 480)
plot(sub$DateTime, sub$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
