download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "~/DSC2020/ExData_Plotting1/data.zip")
#Unzip file using manual tools on computer.
alldata<-read.table("~/DSC2020/ExData_Plotting1/data/household_power_consumption.txt", sep = ";")
#select the data from February first and second, 2007
selection<-alldata[66638:69517,]
selection<-dplyr::rename(selection, Date = V1, Time = V2, Global_active_power = V3, Global_reactive_power = V4, Voltage = V5,
                         Global_intensity = V6, Sub_metering_1 = V7, Sub_metering_2 = V8, Sub_metering_3 = V9)
png(filename = "plot1.PNG")
hist(as.numeric(selection$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = paste("Global Active Power"))
dev.off()