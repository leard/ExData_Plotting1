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

#epc_data<-read.csv2("./data/household_power_consumption.txt")
epc_data<-read.table(file="./data/household_power_consumption.txt", 
                     sep=";", skip=init, nrows=nrows, na.strings=c("?"), col.names=col_names)

head(epc_data)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(epc_data$Global_active_power, 
     col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.off()