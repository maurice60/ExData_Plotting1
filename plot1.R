zip <- 'household_power_consumption.zip'
pwr <- read.table(unz(zip, 'household_power_consumption.txt'), sep=";", header=TRUE, na.strings='?')

pwr$Date <- as.Date(pwr$Date, '%d/%m/%Y')

pwr <- pwr[pwr$Date >= '2007-02-01' & pwr$Date <= '2007-02-02',]

png("plot1.png")
hist(na.omit(pwr$Global_active_power), main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.off()

rm(pwr, zip)

