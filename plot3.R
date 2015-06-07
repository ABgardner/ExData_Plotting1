##Code for the creation of Plot3

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
png(file = "plot3.png", width=480, height=480)

## Create the desired plot
with(consumption,
     plot(1:length(consumption$Time),
          consumption$Sub_metering_1,
          type="l", 
          axes=FALSE, 
          xlab = "",
          ylab="Energy sub metering")
)
lines(1:length(consumption$Time), consumption$Sub_metering_2, col="red")
lines(1:length(consumption$Time), consumption$Sub_metering_3, col="blue")
axis(side = 1, at = c(1,1440,2880), labels = c("Thursday","Friday", "Saturday"))
axis(side = 2, labels=TRUE)
box()
legend("topright", 
       pch = "_____", 
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##close the graphics device
dev.off()