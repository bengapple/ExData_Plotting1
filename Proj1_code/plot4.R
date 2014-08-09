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

        png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
        par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0, 0, 2, 0))

        dev.print(png, file = "plot4.png", width = 480, height = 480, units = "px")
        plot(hdat_fin$Date, hdat_fin[,3], pch = " ", ylab = "Global Active Power (kilowatts)", xlab = " ")
        lines(hdat_fin$Date, hdat_fin[,3], col = "black")
        
        plot(hdat_fin$Date, hdat_fin$Voltage, pch = " ", ylab = "Voltage", xlab = " datetime")
        lines(hdat_fin$Date, hdat_fin$Voltage, col = "black") 
        
        plot(hdat_fin$Date, hdat_fin$Sub_metering_1, pch = "", ylab = "Energy sub metering", xlab = " ")
        legend("topright", pch = "____", col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        lines(hdat_fin$Date, hdat_fin$Sub_metering_1, col="black")
        lines(hdat_fin$Date, hdat_fin$Sub_metering_2, col="red")
        lines(hdat_fin$Date, hdat_fin$Sub_metering_3, col="blue")
        
        plot(hdat_fin$Date, hdat_fin$Global_reactive_power, pch = " ", ylab = "Global_reactive_power", xlab = "datetime ")
        lines(hdat_fin$Date, hdat_fin$Global_reactive_power, col = "black")


        dev.off()
        
      
        
        


        
        

