##    This script is plot1.R. 
##    It creates plot1.png
##
##    This R script utilizes a common R script for acquiring, preparing and oresenting household power
##    consumption data for February 1 and 2, 2007. The plot created by the pre-processing is described
##    in subsequent comments.
##    
##    
##
##    
##
dir.create("c:/Users/John/Documents", showWarnings = FALSE, recursive = TRUE)   # Create all elements on the path 
# Or report nothing if the path exists
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" # Project data Url

download.file(fileUrl, dest = "c:/Users/John/Documents/hpc.zip", mode = "wb")    # Place project data on local drive
unzip("c:/Users/John/Documents/hpc.zip", exdir = "c:/Users/John/Documents")      # Create Household_power_consumption.txt from unzip

column.classes <- c(rep("character", 2), rep("numeric", 7))                      # identify column classes since otherwise factors abound
electric.data <- read.table("c:/Users/John/Documents/household_power_consumption.txt", sep=";", header = FALSE,
                            na.strings ="?", skip = 1, colClasses = column.classes)      # electric data contains all complete rows
#Provide names to the Variables
colnames (electric.data) <- c("Date", "Time", "Global.Active.Power", 
                              "Global.Reactive.Power", "Voltage", "Global.Intensity", "Sub.Metering.1", "Sub.Metering.2", "Sub.Metering.3")

j12 <- subset(electric.data, Date %in% c("1/2/2007", "2/2/2007"))                #Reduce data to two dates as specified in Assignment directions 
date.time <- paste(j12$Date,j12$Time, sep=" ")                                   #Prepare date time 
date.time <- strptime(date.time, "%d/%m/%Y %H:%M:%S")                            #End of common script for Assignnment plots
##
##
#Plot 1 Detail
##
par(mfrow=c(1,1))                                                                #Global Active Power histogram
png("c:/Users/John/Documents/plot1.png", width = 480, height = 480)
hist(j12$Global.Active.Power, col="RED", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()                                                                        #End  Plot 1