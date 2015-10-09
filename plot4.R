Electricp <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
D1 <- subset(Electricp, Date == "1/2/2007" | Date == "2/2/2007")
Sys.setlocale("LC_TIME", "English")

D1$Global_active_power <- 
    as.numeric(as.character(D1$Global_active_power))
D1$Sub_metering_1<- 
    as.numeric(as.character(D1$Sub_metering_1))
D1$Sub_metering_2<- 
    as.numeric(as.character(D1$Sub_metering_2))

combine <- paste(D1$Date , D1$Time)
combine <- strptime(combine, "%d/%m/%Y %H:%M:%S")
D1$combineDT <- combine

par(mfcol = c(2, 2))
par(mar = c(4, 4, 2, 2))
## Plot1
plot(D1$combineDT,D1$Global_active_power,type = "l",
     xlab = " ", ylab = "Global Active Power ")

## Plot2
plot(D1$combineDT , D1$Sub_metering_1 ,type = "l",
     xlab = " ", ylab = "Energy Sub metering" )

lines(D1$combineDT ,D1$Sub_metering_2,col="red")
lines(D1$combineDT ,D1$Sub_metering_3,col="blue")

legend("topright", 
       legend=c("Sun_metering_1","Sun_metering_2","Sun_metering_3"),
       bty = "n",lwd=1,cex=0.7 ,col=c("black","red","blue") )

## Plot3
plot(D1$combineDT , D1$Voltage,type = "l",
     xlab = "datetime ", ylab = "Voltage" )

## Plot4
plot(D1$combineDT , D1$Global_reactive_power,type = "l",
     xlab = "datetime ", ylab = "Global_reactive_power" )

png("Plot4png", width = 480, height=480, type="window")
