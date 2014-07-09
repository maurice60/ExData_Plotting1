zip <- 'household_power_consumption.zip'
pwr <- read.table(unz(zip, 'household_power_consumption.txt'), sep=";", header=TRUE, na.strings='?')

pwr$Date <- paste(pwr$Date, pwr$Time, sep = ' ')
pwr$Date <- strptime(pwr$Date, '%d/%m/%Y %X')

pwr <- pwr[pwr$Date >= as.POSIXlt('2007-02-01 00:00:00') & pwr$Date <= as.POSIXlt('2007-02-02 23:59:00'),]

png("plot2.png")
plot(pwr$Date, pwr$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()

rm(pwr, zip)

