#read data
#make sure NAs are marked right
data <- read.table('./exdata_data_household_power_consumption/household_power_consumption.txt', sep=';', header = TRUE, na.strings=c("NA", "?"))

#subset the days we are interested in
dates <- as.Date(data$Date, '%d/%m/%Y')
ourdates <- as.Date(c('01/02/2007', '02/02/2007'), '%d/%m/%Y')
ourdata <- subset(data, subset = dates %in% ourdates)

#start the png device
png(
  "plot3.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

#plot with line style, no xlabel and no xticks
plot(ourdata$Sub_metering_1, type='l', xaxt='n', xlab=' ', ylab='Energy sub metering')
lines(ourdata$Sub_metering_2, type='l', col='red')
lines(ourdata$Sub_metering_3, type='l', col='blue')
# add xticks
axis(side = 1, at = c(0,1440,2880),labels = c('Thu', 'Fri', 'Sat'))
#add legend
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)

dev.off()