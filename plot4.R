epc <- read.csv2("household_power_consumption.txt",
                 sep=";",
                 dec = ".",
                 na.strings=c("","?"),
                 colClasses = c("character", "character","numeric", "numeric", "numeric"
                                ,"numeric", "numeric", "numeric", "numeric"))
#Add a column with DateTime
epc$DateTime <- strptime(paste(epc$Date, epc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

epc[,"Date"] <- as.Date(epc[,"Date"],"%d/%m/%Y")
epc2 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

library(datasets)
par(mfrow=c(2,2))

with(epc2,
    {
      #1st Chart
      plot(DateTime, Global_active_power , type="l", xlab="", ylab="Global Active Power")

      #2nd Chart
      plot(DateTime, Voltage , type="l", xlab="datetime", ylab="Voltage")

      #3rd chart

      plot(DateTime, Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
      lines(DateTime, Sub_metering_2 , type="l", col="red")
      lines(DateTime, Sub_metering_3 , type="l", col="blue")
      legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))

      #4th chart
      plot(DateTime, Global_reactive_power , type="l", xlab="datetime")
    }
)

dev.copy(png, file = "plot4.png")
dev.off()
