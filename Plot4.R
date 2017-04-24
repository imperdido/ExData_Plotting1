pwr_cnsmp <-read.table("household_power_consumption.txt", sep=";", header=TRUE)
pwr_cnsmp$Date <- as.Date(pwr_cnsmp$Date, "%d/%m/%Y")
pwr_cnsmp$time <- paste(pwr_cnsmp$Date, pwr_cnsmp$Time)
pwr_cnsmp$time <- strptime(pwr_cnsmp$time, "%Y-%m-%d %H:%M:%S")
pwr_cnsmp_fltr <- pwr_cnsmp[pwr_cnsmp$Date == "2007-2-2"|pwr_cnsmp$Date == "2007-2-1",]
#pwr_cnsmp_fltr$Global_active_power <- as.numeric(as.character(pwr_cnsmp_fltr$Global_active_power))
pwr_cnsmp_fltr$Sub_metering_1 <- as.numeric(as.character(pwr_cnsmp_fltr$Sub_metering_1))
pwr_cnsmp_fltr$Sub_metering_2 <- as.numeric(as.character(pwr_cnsmp_fltr$Sub_metering_2))
pwr_cnsmp_fltr$Sub_metering_3 <- as.numeric(as.character(pwr_cnsmp_fltr$Sub_metering_3))
png(filename = "Plot4.png")
par(mfrow = c(2,2))
#plot from plot2
pwr_cnsmp_fltr$Global_active_power <- as.numeric(as.character(pwr_cnsmp_fltr$Global_active_power))
with(pwr_cnsmp_fltr, plot( time, Global_active_power,type="n",ylab = "Global Active Power",xlab =""))
with(pwr_cnsmp_fltr,lines(time,Global_active_power))

#voltage
pwr_cnsmp_fltr$Voltage <- as.numeric(as.character(pwr_cnsmp_fltr$Voltage))
with(pwr_cnsmp_fltr, plot(time,Voltage,type="n",ylab = "Voltage",xlab ="datetime"))
with(pwr_cnsmp_fltr,lines(time,Voltage))


#plot from plot3
with(pwr_cnsmp_fltr, plot(time, Sub_metering_1,type="n",ylab = "Energy sub metering",xlab =""))
with(pwr_cnsmp_fltr,lines(time,Sub_metering_1,col="gray0"))
with(pwr_cnsmp_fltr,lines(time,Sub_metering_2,col="red"))
with(pwr_cnsmp_fltr,lines(time,Sub_metering_3,col="blue"))
legend("topright", lty =1, bty="n", col= c("gray0", "red", "blue"), legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), cex = 0.75)

#reactive_power
pwr_cnsmp_fltr$Global_reactive_power <- as.numeric(as.character(pwr_cnsmp_fltr$Global_reactive_power))
with(pwr_cnsmp_fltr, plot(time, Global_reactive_power,type="n",ylab = "Global_reactive_power",xlab ="datetime"))
with(pwr_cnsmp_fltr,lines(time,Global_reactive_power))

dev.off()




