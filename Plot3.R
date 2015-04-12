#plot3.R

#Read the data

#The data can be downloaded from the following url - amend the filename*
#below for the read step

#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

hh<-read.delim('/Users/jus/household_power_consumption.txt',header=T,sep=';',na.strings='?',as.is=T)
#       *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Add a specific MeasDate and DateTIme variables holding the date and date time.
hh$MeasDate<-as.Date(hh$Date,"%d/%m/%Y")

hh$DateTime<-strptime(paste(hh$Date,hh$Time),"%d/%m/%Y %H:%M:%S")

hhsub<-hh[hh$MeasDate>=as.Date('01/02/2007','%d/%m/%Y') & 
           hh$MeasDate<=as.Date('02/02/2007','%d/%m/%Y'),]

# Now plot
plot(hhsub$DateTime,hhsub$Sub_metering_1, type="n", main="",xlab="",ylab='Energy Sub Metering') 
lines(hhsub$DateTime,hhsub$Sub_metering_1, col='black') 
lines(hhsub$DateTime,hhsub$Sub_metering_2, col='red') 
lines(hhsub$DateTime,hhsub$Sub_metering_3, col='blue') 
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c('black','red','blue'),lty=1)

# Now plot to a file
png(file='/Users/jus/Desktop/ExData_Plotting1/Plot3.png',width=480,heigh=480)
 plot(hhsub$DateTime,hhsub$Sub_metering_1, type="n", main="",xlab="",ylab='Energy Sub Metering') 
 lines(hhsub$DateTime,hhsub$Sub_metering_1, col='black') 
 lines(hhsub$DateTime,hhsub$Sub_metering_2, col='red') 
 lines(hhsub$DateTime,hhsub$Sub_metering_3, col='blue') 
 legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c('black','red','blue'),lty=1)
dev.off()

