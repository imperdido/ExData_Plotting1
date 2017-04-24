plotActivePowerHist <- function()

pwr_cnsmp <-read.table("household_power_consumption.txt", sep=";", header=TRUE)
pwr_cnsmp$Date <- as.Date(pwr_cnsmp$Date, "%d/%m/%Y")
pwr_cnsmp_fltr <- pwr_cnsmp[pwr_cnsmp$Date == "2007-2-2"|pwr_cnsmp$Date == "2007-2-1",]
pwr_cnsmp_fltr$Global_active_power <- as.numeric(as.character(pwr_cnsmp_fltr$Global_active_power))
png(filename = "Plot1.png")
hist(pwr_cnsmp_fltr$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

