zip <- 'household_power_consumption.zip'
pwr <- read.table(unz(zip, 'household_power_consumption.txt'), sep=";", header=TRUE, na.strings='?')

pwr$Date <- paste(pwr$Date, pwr$Time, sep = ' ')
pwr$Date <- strptime(pwr$Date, '%d/%m/%Y %X')

pwr <- pwr[pwr$Date >= as.POSIXlt('2007-02-01 00:00:00') & pwr$Date <= as.POSIXlt('2007-02-02 23:59:00'),]

png("plot4.png")
par(mfcol=c(2,2))
plot(pwr$Date, pwr$Global_active_power, type='l', xlab='', ylab='Global Active Power')

y = pwr$Sub_metering_1
x = pwr$Date
plot(x, y, type='n', xlab='', ylab='Energy sub metering')
points(pwr$Date, pwr$Sub_metering_1, type='l')
points(pwr$Date, pwr$Sub_metering_2, type='l', col='red')
points(pwr$Date, pwr$Sub_metering_3, type='l', col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       cex=.75, xjust=1, y.intersp=.85,
       lty=c(1,1,1),col=c('black','red','blue'))

plot(pwr$Date, pwr$Voltage, type='l', xlab='datetime', ylab='Voltage')

plot(pwr$Date, pwr$Global_reactive_power, type='l', xlab='datetime', ylab='Global Reactive Power')

dev.off()

rm(pwr, x, y, zip)

