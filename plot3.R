data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
attach(data)
plot(Datetime, Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"),lty=1,cex=0.75,text.width = strwidth("Sub_metering_1"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
detach(data)
## Save
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
