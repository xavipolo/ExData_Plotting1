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
     
     plot(DateTime, Global_active_power , type="l", xlab="", ylab="Global Active Power (kilowatts)")
)
dev.copy(png, file = "plot2.png")
dev.off()

