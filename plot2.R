plot2 <- function(data_file) {

	data <- read.table(pipe(paste('grep "^[1-2]/2/2007"'," ",data_file)),sep=";",na.strings="?")
	names(data) <- unname(unlist(read.table(data_file,nrows=1,sep=";")[1,]))
	data$dateTime <- strptime(paste(as.Date(data$Date,"%d/%m/%Y"),data$Time), "%Y-%m-%d %H:%M:%S")
	png(file= "plot2.png",width=480,height=480)
	plot(data$dateTime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
	dev.off()



}
