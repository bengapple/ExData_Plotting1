if(!file.exists( "household_power_consumption.txt")){
        fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile =  "household_power_consumption.zip")
        unzip("household_power_consumption.zip", exdir = "D:/RFiles")
        dateDownloaded <- date()
        list.files("D:/Rfiles")
}
hdat <- read.table("household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
hdat1 <- subset(hdat, hdat$Date == "1/2/2007")
hdat2 <- subset(hdat, hdat$Date == "2/2/2007")
hdat_fin <- as.data.frame(rbind(hdat1, hdat2))
hdat_fin$Date <- strptime(paste(hdat_fin$Date, hdat_fin$Time), "%d/%m/%Y %H:%M:%S")
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
with(hdat_fin, hist(hdat_fin[,3], col = "red", xlab = "Global Active Power (kilowatts)",main = paste("Global Active Power" )))

dev.off()