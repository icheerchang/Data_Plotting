Electricp <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
D1 <- subset(Electricp, Date == "1/2/2007" | Date == "2/2/2007")
D1$Global_active_power <- 
    as.numeric(as.character(D1$Global_active_power))

Sys.setlocale("LC_TIME", "English")

combine <- paste(D1$Date , D1$Time)
combine <- strptime(combine, "%d/%m/%Y %H:%M:%S")
D1$combineDT <- combine

plot(D1$combineDT,D1$Global_active_power,type = "n",
    xlab = " ", ylab = "Global Active Power (kilowatts)")

lines(D1$combineDT , D1$Global_active_power)

dev.copy(png, file="plot2.png")
dev.off()
