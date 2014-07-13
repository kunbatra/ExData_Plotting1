
power <- read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", stringsAsFactors = FALSE)

power$dt_tm <- paste(power$Date, power$Time, sep=" ")

power$dt_tm <- strptime(power$dt_tm,"%d/%m/%Y %H:%M:%S")

power_ltd <- subset(power, as.Date(dt_tm)>="2007-02-01" & as.Date(dt_tm)<="2007-02-02")

power_ltd$Global_active_power <- as.numeric(power_ltd$Global_active_power)
power_ltd$Sub_metering_1 <- as.numeric(power_ltd$Sub_metering_1)
power_ltd$Sub_metering_2 <- as.numeric(power_ltd$Sub_metering_2)
power_ltd$Sub_metering_3 <- as.numeric(power_ltd$Sub_metering_3)

par(mfrow = c(2,2))
par(mar = c(3,3,3,3))

plot(power_ltd$dt_tm, power_ltd$Global_active_power,
                      type="l", xlab = "", 
                       ylab = "Global Active Power")

power_ltd$Voltage <- as.numeric(power_ltd$Voltage)
plot(power_ltd$dt_tm, power_ltd$Voltage,
     type="l", xlab = "datetime", 
     ylab = "Voltage")


plot(power_ltd$dt_tm, power_ltd$Sub_metering_1,
     type="l", xlab = "", 
     ylab = "Energy sub metering")
lines(power_ltd$dt_tm, power_ltd$Sub_metering_2, col="red")
lines(power_ltd$dt_tm, power_ltd$Sub_metering_3, col="blue")

legend("topright" , # places a legend at the appropriate place 
       c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       bty="n",
       lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"),
       cex = 1) # gives the legend lines the correct


power_ltd$Global_reactive_power <- as.numeric(power_ltd$Global_reactive_power)
plot(power_ltd$dt_tm, power_ltd$Global_reactive_power,
     type="l", xlab = "datetime", 
     ylab = "Global_reactive_power")


