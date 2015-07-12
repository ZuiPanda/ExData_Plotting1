data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4
attach(data)
par(mfrow=c(2,2))
#1
plot(Datetime, Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
#2
plot(Datetime, Voltage, type="l",
     ylab="Voltage", xlab="datetime")
#3
plot(Datetime, Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"),lty=1,cex=0.75,text.width = strwidth("Sub_metering_1"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(Datetime, Global_reactive_power, type="l",
     ylab="Global Reactive Power (kilowatts)", xlab="")


detach(data)
## Save
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
