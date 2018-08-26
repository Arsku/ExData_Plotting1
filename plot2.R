#read data
#make sure NAs are marked right
data <- read.table('./exdata_data_household_power_consumption/household_power_consumption.txt', sep=';', header = TRUE, na.strings=c("NA", "?"))

#subset the days we are interested in
dates <- as.Date(data$Date, '%d/%m/%Y')
ourdates <- as.Date(c('01/02/2007', '02/02/2007'), '%d/%m/%Y')
ourdata <- subset(data, subset = dates %in% ourdates)

#start the png device
png(
  "plot2.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

#plot with line style, no xlabel and no xticks
plot(ourdata$Global_active_power, type='l', xaxt='n', xlab=' ', ylab='Global Active Power (kilowatts)')
# add xticks
axis(side = 1, at = c(0,1440,2880),labels = c('Thu', 'Fri', 'Sat'))

dev.off()