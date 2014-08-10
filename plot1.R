consumption <- read.table("household_power_consumption.txt",sep=";",
                header=TRUE,na.strings="NA",stringsAsFactors=FALSE)
consumption$Date <- as.Date(consumption$Date,"%d/%m/%Y")
mydata1 <- subset(consumption,Date=="2007-02-01"|Date=="2007-02-02")
mydata2 <- as.numeric(mydata1[[3]])
png(filename="plot1.png",width=480,height=480)
hist(mydata2,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.off()