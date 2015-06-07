##Code for the creation of Plot1

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
png(file = "plot1.png", width=480, height=480)

## Create the desired plot
with(consumption,
     hist(consumption$Global_active_power,
        col="red",
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)")
)
##close the graphics device
dev.off()

