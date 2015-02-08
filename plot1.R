plot1 <- function(file = "./household_power_consumption.txt") {
        library(sqldf)
        sample <- read.csv.sql(file, sep = ";", stringsAsFactors = F, sql = "select * from file where (date == '1/2/2007' OR date == '2/2/2007')")
        png(file = "plot1.png")
        hist(sample$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
        closeAllConnections()
}