consumption <- read.table("household_power_consumption.txt",sep=";",
                          header=TRUE,na.strings="NA",stringsAsFactors=FALSE)
mydata1 <- subset(consumption,Date=="1/2/2007"|Date=="2/2/2007")
mydata1$Date <- strptime(paste(mydata1$Date,mydata1$Time),"%d/%m/%Y %H:%M:%S")
#data for picture1  (1,1)
pic1 <- as.numeric(mydata1[[3]])
#data for picture2  (1,2)
pic2  <- as.numeric(mydata1[[5]])
#data for picture3  (2,1)
pic31 <- as.numeric(mydata1[[7]])
pic32<- as.numeric(mydata1[[8]])
pic33 <- as.numeric(mydata1[[9]])
#data  for picture4 (2,2)
pic4 <- as.numeric(mydata1[[4]])
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#plot picture1
plot(mydata1$Date,pic1,type="l",xlab="",ylab="Global Active Power")
#plot picture2
plot(mydata1$Date,pic2,type="l",xlab="datetime",ylab="Voltage")
#plot picture3
plot(mydata1$Date,pic31,type="l",xlab="",ylab="Energy sub metering")
lines(mydata1$Date,pic32,type="l",col="red")
lines(mydata1$Date,pic33,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
#plot picture 4
plot(mydata1$Date,pic4,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()