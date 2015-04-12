#plot2.R

#Read the data

#The data can be downloaded from the following url - amend the filename*
#below for the read step

#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

hh<-read.delim('/Users/jus/household_power_consumption.txt',header=T,sep=';')
#       *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Add a specific MeasDate and DateTIme variables holding the date and date time.
hh$MeasDate<-as.Date(hh$Date,"%d/%m/%Y")

hh$DateTime<-strptime(paste(hh$Date,hh$Time),"%d/%m/%Y %H:%M:%S")

hhsub<-hh[hh$MeasDate>=as.Date('01/02/2007','%d/%m/%Y') & 
           hh$MeasDate<=as.Date('02/02/2007','%d/%m/%Y'),]

# Now plot
plot(hhsub$DateTime,as.numeric(hhsub$Global_active_power)/1000, type="n", 
     main="",xlab="",ylab='Global Active Power (kilowatts)') 
lines(hhsub$DateTime,as.numeric(hhsub$Global_active_power)/1000) 

# Now plot to a file
png(file='/Users/jus/Desktop/ExData_Plotting1/Plot2.png',width=480,heigh=480)
 plot(hhsub$DateTime,as.numeric(hhsub$Global_active_power)/1000, type="n", 
      main="",xlab="",ylab='Global Active Power (kilowatts)') 
 lines(hhsub$DateTime,as.numeric(hhsub$Global_active_power)/1000) 
dev.off()
