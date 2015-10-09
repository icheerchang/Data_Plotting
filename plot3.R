Electricp <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
D1 <- subset(Electricp, Date == "1/2/2007" | Date == "2/2/2007")
Sys.setlocale("LC_TIME", "English")

D1$Sub_metering_1<- 
    as.numeric(as.character(D1$Sub_metering_1))
D1$Sub_metering_2<- 
    as.numeric(as.character(D1$Sub_metering_2))


combine <- paste(D1$Date , D1$Time)
combine <- strptime(combine, "%d/%m/%Y %H:%M:%S")
D1$combineDT <- combine


plot3 <- plot(D1$combineDT , D1$Sub_metering_1 ,type = "l",
     xlab = " ", ylab = "Energy Submetering" )

lines(D1$combineDT ,D1$Sub_metering_2,col="red")
lines(D1$combineDT ,D1$Sub_metering_3,col="blue")

legend("topright", 
       legend=c("Sun_metering_1","Sun_metering_2","Sun_metering_3"),
       lwd=1, col=c("black","red","blue") )

png("Plot.3png", width = 480, height=480, type="window")
