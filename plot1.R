epc <- read.csv2("household_power_consumption.txt",
                 sep=";",
                 dec = ".",
                 na.strings=c("","?"),
                 colClasses = c("character", "character","numeric", "numeric", "numeric"
                                ,"numeric", "numeric", "numeric", "numeric"))

epc[,"Date"] <- as.Date(epc[,"Date"],"%d/%m/%Y")
epc2 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

library(datasets)
with(epc2, 
     hist(Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
     )
dev.copy(png, file = "plot1.png")
dev.off()


