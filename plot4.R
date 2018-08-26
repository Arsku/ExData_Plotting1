#read data
#make sure NAs are marked right
data <- read.table('./exdata_data_household_power_consumption/household_power_consumption.txt', sep=';', header = TRUE, na.strings=c("NA", "?"))

#subset the days we are interested in
dates <- as.Date(data$Date, '%d/%m/%Y')
ourdates <- as.Date(c('01/02/2007', '02/02/2007'), '%d/%m/%Y')
ourdata <- subset(data, subset = dates %in% ourdates)

#start the png device
png(
  "plot4.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

par(mfrow=c(2,2))


#plot1
plot(ourdata$Global_active_power, type='l', xaxt='n', xlab=' ', ylab='Global Active Power')
# add xticks
axis(side = 1, at = c(0,1440,2880),labels = c('Thu', 'Fri', 'Sat'))

#plot2
plot(ourdata$Voltage, type='l', xlab='datetime', ylab='Voltage', xaxt='n')
# add xticks
axis(side = 1, at = c(0,1440,2880),labels = c('Thu', 'Fri', 'Sat'))



#plot3
plot(ourdata$Sub_metering_1, type='l', xaxt='n', xlab=' ', ylab='Energy sub metering')
lines(ourdata$Sub_metering_2, type='l', col='red')
lines(ourdata$Sub_metering_3, type='l', col='blue')
# add xticks
axis(side = 1, at = c(0,1440,2880),labels = c('Thu', 'Fri', 'Sat'))
#add legend
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, bty='n')

#plot4
plot(ourdata$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power', xaxt='n')
# add xticks
axis(side = 1, at = c(0,1440,2880),labels = c('Thu', 'Fri', 'Sat'))



dev.off()