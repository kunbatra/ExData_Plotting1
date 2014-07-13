
setwd("E:/Personal/__Learning/__Coursera/Johns Hopkins - Data Science/04. Exploratory Data Analysis/Course Project 1")

power <- read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", stringsAsFactors = FALSE)


power_dt <- power

power_dt$dt_tm <- paste(power_dt$Date, power_dt$Time, sep=" ")

power_dt$dt_tm <- strptime(power_dt$dt_tm,"%d/%m/%Y %H:%M:%S")

power_ltd <- subset(power_dt, power_dt>="2007-02-01" & power_dt<="2007-02-02")

power_tm <- power_ltd

power_tm$Time <- (strptime(power_ltd$Time,"%H:%M:%S"))

power_tm$Global_active_power <- as.numeric(power_tm$Global_active_power)

hist(power_tm$Global_active_power, col="red", 
     xlab = "Global Active Power(kilowatts)", 
     main = "Global Active Power")

lines(power_tm$Date,power_tm$Global_active_power)
