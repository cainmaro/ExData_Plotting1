
# getting the original data from the txt file

original.data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)

#subestting and getting records only between the two dates 1/2/2007","2/2/2007 
filtered.data <- original.data[original.data$Date %in% c("1/2/2007","2/2/2007") ,]

# converting to date format "%Y-%m-%d %H:%M:%S"
tmpDate <- as.character(as.Date(filtered.data$Date, "%d/%m/%Y"))
tmpDate <- paste(tmpDate, filtered.data$Time)
finalDate <- strptime(tmpDate, "%Y-%m-%d %H:%M:%S")

# making graphic

png("plot2.png", width = 480, height = 480)
plot(finalDate, as.numeric(filtered.data$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
