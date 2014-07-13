
power <- read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", stringsAsFactors = FALSE)

power$dt_tm <- paste(power$Date, power$Time, sep=" ")

power$dt_tm <- strptime(power$dt_tm,"%d/%m/%Y %H:%M:%S")

power_ltd <- subset(power, as.Date(dt_tm)>="2007-02-01" & as.Date(dt_tm)<="2007-02-02")

power_ltd$Global_active_power <- as.numeric(power_ltd$Global_active_power)

plot(power_ltd$dt_tm,power_ltd$Global_active_power, 
     type="l", xlab = "", ylab = "Global Active Power(kilowatts")
