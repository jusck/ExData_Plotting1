#plot1.R

#Read the data

#The data can be downloaded from the following url - amend the filename*
#below for the read step

#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

hh<-read.delim('/Users/jus/household_power_consumption.txt',header=T,sep=';',na.strings='?',as.is=T)
#       *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Add a specific MeasDate variable holding the date.
hh$MeasDate<-as.Date(hh$Date,"%d/%m/%Y")

hhsub<-hh[hh$MeasDate>=as.Date('01/02/2007','%d/%m/%Y') & 
          hh$MeasDate<=as.Date('02/02/2007','%d/%m/%Y'),]

# Now plot
with(hhsub,hist(Global_active_power,breaks=24,col="red",
                main="Global Active Power",xlab="Global Active Power (kilowatts)"))

# Now plot to a file
png(file='/Users/jus/Desktop/ExData_Plotting1/Plot1.png',width=480,heigh=480)
with(hhsub,hist(Global_active_power,breaks=24,col="red",
                main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()

