##Code for the creation of Plot4

##Load the Data from 2007-02-01 and 2007-02-02
Headers <- read.table("household_power_consumption.txt", 
                      sep=";", 
                      nrows =1, 
                      stringsAsFactors = FALSE)
Headers <- as.character(Headers)
consumption <- read.table("household_power_consumption.txt", 
                          sep=";",
                          col.names=Headers, 
                          skip =66637, 
                          nrows = 2880, 
                          stringsAsFactors=FALSE,)

## Call the desired graphics device
png(file = "plot4.png", width=480, height=480)

## Create the desired work space
par(mfrow = c(2,2))

##Create Plot
with(consumption,{

##Create 1st-Micro Plot 
  plot(1:length(consumption$Time),
       consumption$Global_active_power,
       type="l", 
       axes=FALSE, 
       xlab = "",
       ylab="Global Active Power (kilowatts)")
  axis(side = 1, at = c(1,1440,2880), labels = c("Thursday","Friday", "Saturday"))
  axis(side = 2, labels=TRUE)
  box()
  
##Create 2nd-Micro Plot
  plot(1:length(consumption$Time),
       consumption$Voltage,
       type="l", 
       axes=FALSE, 
       xlab = "datetime",
       ylab="Voltage")
  axis(side = 1, at = c(1,1440,2880), labels = c("Thursday","Friday", "Saturday"))
  axis(side = 2, labels=TRUE)
  box()

## Create 3rd-Micro Plot
  plot(1:length(consumption$Time),
       consumption$Sub_metering_1,
       type="l", 
       axes=FALSE, 
       xlab = "",
       ylab="Energy sub metering")
  lines(1:length(consumption$Time), consumption$Sub_metering_2, col="red")
  lines(1:length(consumption$Time), consumption$Sub_metering_3, col="blue")
  axis(side = 1, at = c(1,1440,2880), labels = c("Thursday","Friday", "Saturday"))
  axis(side = 2, labels=TRUE)
  legend("topright", 
         pch = "_____", 
         col = c("black","red","blue"),
         border = "white",
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  box()

##Create 4th-Micro Plot
  plot(1:length(consumption$Time),
       consumption$Global_reactive_power,
       type="l", 
       axes=FALSE, 
       xlab = "datetime",
       ylab="Global_reactive_power")
  axis(side = 1, at = c(1,1440,2880), labels = c("Thursday","Friday", "Saturday"))
  axis(side = 2, labels=TRUE)
  box()
})

##close the graphics device
dev.off()