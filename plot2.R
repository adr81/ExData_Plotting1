plot2 <- function(file = "./household_power_consumption.txt") {
        library(sqldf)
        sample <- read.csv.sql(file, sep = ";", stringsAsFactors = F, sql = "select * from file where (date == '1/2/2007' OR date == '2/2/2007')")
        cols <- c(colnames(sample), "Date_Time")
        sample <- cbind(sample, strptime(paste(sample$Date, sample$Time), "%d/%m/%Y %H:%M:%S"))
        colnames(sample) <- cols
        png(file = "plot2.png")
        plot(sample$Date_Time, sample$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
        closeAllConnections()
}