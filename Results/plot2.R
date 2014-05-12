if(!file.exists("data")){
  dir.create("./data")
}
#download file
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/power_consumption.zip")

#unpack zip file
unzip("./data/power_consumption.zip")

#read dataset
#init 66638
#end  69517
init<-66638-1
nrows<-69517-init

#read Column names
col_names<-read.table(file="./data/household_power_consumption.txt", sep=";", nrows=1, stringsAsFactors=F)


epc_data<-read.table(file="./data/household_power_consumption.txt", 
                     sep=";", skip=init, nrows=nrows, na.strings=c("?"), col.names=col_names)
#format data
epc_data$Date_formated = format(strptime(epc_data[,1], format ="%d/%m/%Y"), "%a")

head(epc_data)
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(epc_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="", xaxt="n")

axis(side = 1, at = c(1,(nrows/2 + 1),2880), labels = c("Thu", "Fri", "Sat"))

dev.off()