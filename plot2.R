consumption <- read.table("household_power_consumption.txt",sep=";",
                          header=TRUE,na.strings="NA",stringsAsFactors=FALSE)
mydata1 <- subset(consumption,Date=="1/2/2007"|Date=="2/2/2007")
mydata1$Date <- strptime(paste(mydata1$Date,mydata1$Time),"%d/%m/%Y %H:%M:%S")
mydata2 <- as.numeric(mydata1[[3]])
png(filename="plot2.png",width=480,height=480)
plot(mydata1$Date,mydata2,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()