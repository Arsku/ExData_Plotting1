#read data
#make sure NAs are marked right
data <- read.table('./exdata_data_household_power_consumption/household_power_consumption.txt', sep=';', header = TRUE, na.strings=c("NA", "?"))

#subset the days we are interested in
dates <- as.Date(data$Date, '%d/%m/%Y')
ourdates <- as.Date(c('01/02/2007', '02/02/2007'), '%d/%m/%Y')
ourdata <- subset(data, subset = dates %in% ourdates)

#start the png device
png(
  "plot1.png",
  width     = 480,
  height    = 480,
  units     = "px"
)

#plot and close the png device
hist(ourdata$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()