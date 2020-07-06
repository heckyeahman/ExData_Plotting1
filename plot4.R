download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "~/DSC2020/ExData_Plotting1/data.zip")
#Unzip file using manual tools on computer.
alldata<-read.table("~/DSC2020/ExData_Plotting1/data/household_power_consumption.txt", sep = ";")
#select the data from February first and second, 2007
selection<-alldata[66638:69517,]
selection<-dplyr::rename(selection, Date = V1, Time = V2, Global_active_power = V3, Global_reactive_power = V4, Voltage = V5,
                         Global_intensity = V6, Sub_metering_1 = V7, Sub_metering_2 = V8, Sub_metering_3 = V9)
png(filename = "plot4.PNG")
par(mfrow = c(2,2))
#plot1
plot(selection$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",
     xaxt= "n")
days<-c("Thu", "Fri", "Sat")
axis(side = 1, at = c(0,1500,2880), labels = days)
#plot2
plot(selection$Voltage, type = "l", ylab = "Voltage", xlab = "datetime",
     xaxt= "n")
axis(side = 1, at = c(0,1500,2880), labels = days)
#plot3
plot(selection$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(selection$Sub_metering_2, col= "red")
lines(selection$Sub_metering_3, col = "blue")
days<-c("Thu", "Fri", "Sat")
axis(side = 1, at = c(0,1500,2880), labels = days)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red","blue"), pch = "_")
#plot4
plot(selection$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime",
     xaxt= "n")
axis(side = 1, at = c(0,1500,2880), labels = days)
dev.off()