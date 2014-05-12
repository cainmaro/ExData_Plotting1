
# getting the original data from the txt file
original.data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)

#subestting and getting records only between the two dates 1/2/2007","2/2/2007 
filtered.data <- original.data[original.data$Date %in% c("1/2/2007","2/2/2007") ,]

# converting to date format "%Y-%m-%d %H:%M:%S"
tmpDate<- as.character(as.Date(filtered.data$Date, "%d/%m/%Y"))
tmpDate <- paste(tmpDate, filtered.data$Time)
tmpDate<- strptime(tmpDate, "%Y-%m-%d %H:%M:%S")

# making graphic
png("plot3.png", width = 480, height = 480)
plot(tmpDate, as.numeric(filtered.data$Sub_metering_1), type="l",
     ylab="Energy Sub metering", xlab="")
lines(tmpDate, as.numeric(filtered.data$Sub_metering_2), type="l", col="red")
lines(tmpDate, as.numeric(filtered.data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
       col=c("black", "red", "blue"))
dev.off()
