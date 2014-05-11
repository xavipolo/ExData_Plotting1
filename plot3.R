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
with(epc2, 
     plot(DateTime, Sub_metering_1 , type="l", xlab="", ylab="Global Active Power (kilowatts)")
)
with(epc2,
     lines(DateTime, Sub_metering_2 , type="l", col="red")
)
with(epc2,
     lines(DateTime, Sub_metering_3 , type="l", col="blue")
)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))

dev.copy(png, file = "plot3.png")
dev.off()
