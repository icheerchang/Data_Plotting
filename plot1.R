Electricp <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")
D1 <- subset(Electricp, Date == "1/2/2007" | Date == "2/2/2007")
D1$Global_active_power <- as.numeric(as.character(D1$Global_active_power))

plot(D1$Time,D1$Global_active_power)
?as.Date()