plot3 <- function(file = "./household_power_consumption.txt") {
        library(sqldf)
        sample <- read.csv.sql(file, sep = ";", stringsAsFactors = F, sql = "select * from file where (date == '1/2/2007' OR date == '2/2/2007')")
        cols <- c(colnames(sample), "Date_Time")
        sample <- cbind(sample, strptime(paste(sample$Date, sample$Time), "%d/%m/%Y %H:%M:%S"))
        colnames(sample) <- cols
        png(file = "plot3.png")
        plot(sample$Date_Time, sample$Sub_metering_1, type = "l", ylim = range(c(0, 40)), xlab = "", ylab = "Energy sub metering")
        par(new = T)
        plot(sample$Date_Time, sample$Sub_metering_2, type = "l", col = "red", ylim = range(c(0, 40)), xlab = "", ylab = "Energy sub metering")
        par(new = T)
        plot(sample$Date_Time, sample$Sub_metering_3, type = "l", col = "blue", ylim = range(c(0, 40)), xlab = "", ylab = "Energy sub metering")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        closeAllConnections()
}