
# getting the original data from the txt file
original.data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)

#subestting and getting records only between the two dates 1/2/2007","2/2/2007 
filtered.data <- original.data[original.data$Date %in% c("1/2/2007","2/2/2007") ,]

# making graphic

png("plot1.png", width = 480, height = 480)
hist(as.numeric(filtered.data$Global_active_power), col="red",
     main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
