plot4 <- function(file = "./household_power_consumption.txt") {
        library(sqldf)
        sample <- read.csv.sql(file, sep = ";", stringsAsFactors = F, sql = "select * from file where (date == '1/2/2007' OR date == '2/2/2007')")
        cols <- c(colnames(sample), "Date_Time")
        sample <- cbind(sample, strptime(paste(sample$Date, sample$Time), "%d/%m/%Y %H:%M:%S"))
        colnames(sample) <- cols
        png(file = "plot4.png")
        par(mfrow = c(2, 2))
        plot(sample$Date_Time, sample$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(sample$Date_Time, sample$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        with(sample, {
                plot(sample$Date_Time, sample$Sub_metering_1, type = "l", ylim = range(c(0, 40)), xlab = "", ylab = "Energy sub metering")
                par(new = T)
                plot(sample$Date_Time, sample$Sub_metering_2, type = "l", col = "red", ylim = range(c(0, 40)), xlab = "", ylab = "Energy sub metering")
                par(new = T)
                plot(sample$Date_Time, sample$Sub_metering_3, type = "l", col = "blue", ylim = range(c(0, 40)), xlab = "", ylab = "Energy sub metering")
                legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.9)
        })
        plot(sample$Date_Time, sample$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        dev.off()
        closeAllConnections()
}