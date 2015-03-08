plot4 <- function(data_file) {

	data <- read.table(pipe(paste('grep "^[1-2]/2/2007"'," ",data_file)),sep=";",na.strings="?")
	names(data) <- unname(unlist(read.table(data_file,nrows=1,sep=";")[1,]))
	data$dateTime <- strptime(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time), "%Y-%m-%d %H:%M:%S")
	png(file= "plot4.png",width=480,height=480)
	
	par(mfrow=c(2,2))

	plot(data$dateTime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
	plot(data$dateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
	plot(data$dateTime,data$Sub_metering_1,type="l",col="black",ylim=c(0,40),ylab="Energy sub metering",xlab="", yaxt="n")
	axis(2,at=c(0,10,20,30),labels=c(0,10,20,30))
	par(new=TRUE)
	plot(data$dateTime,data$Sub_metering_2,type="l",col="red",ylim=c(0,40),ylab="Energy sub metering",xlab="", yaxt="n")
	par(new=TRUE)
	plot(data$dateTime,data$Sub_metering_3,type="l",col="blue",ylim=c(0,40),ylab="Energy sub metering",xlab="", yaxt="n")
	legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),bty="n")


	plot(data$dateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",yaxt="n",ylim=c(0,0.5))
	axis(2,cex.axis=0.9,at=c(0.0,0.1,0.2,0.3,0.4,0.5),label=c(0.0,0.1,0.2,0.3,0.4,0.5))

	dev.off()


}
