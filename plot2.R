##Code for the creation of Plot2

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
png(file = "plot2.png", width=480, height=480)

## Create the desired plot
with(consumption,
     plot(1:length(consumption$Time),
          consumption$Global_active_power,
          type="l", 
          axes=FALSE, 
          xlab = "",
          ylab="Global Active Power (kilowatts)")
)
axis(side = 1, at = c(1,1440,2880), labels = c("Thursday","Friday", "Saturday"))
axis(side = 2, labels=TRUE)
box()

##close the graphics device
dev.off()
