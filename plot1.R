source("loadHPCData.R")

plot1 <- function(data=NULL) {
    if(is.null(data)) data <- loadHPCData()
    
    png("plot1.png", width=504, height=504)
    
    hist(data$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         col="red")
    
    dev.off()

}