# Load dataset into R
library(data.table)

loadHPCData <- function() {

    df <- fread("household_power_consumption.txt",
                header=TRUE,
                sep=";",
                colClasses=c("character", "character", rep("numeric",7)),
                na="?")

    # convert date variables to Date/Time class
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    
    # only use data from the dates 2007-02-01 and 2007-02-02
    df <- df[df$Date %between% c("2007-02-01","2007-02-02"),]

    # convert time variables to Time class
    df$Time <- as.POSIXct(paste(df$Date, df$Time))
        
    return(df)
    
}