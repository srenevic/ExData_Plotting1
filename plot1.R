plot1 <- function(data_file) {

	data <- read.table(pipe(paste('grep "^[1-2]/2/2007"'," ",data_file)),sep=";",na.strings="?")
	names(data) <- unname(unlist(read.table(data_file,nrows=1,sep=";")[1,]))
	png(file= "plot1.png",width=480,height=480)
	hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
	dev.off()



}

