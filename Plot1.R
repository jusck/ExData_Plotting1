#plot1.R

#Read the data

#The data can be downloaded from the following url - amend the filename*
#below for the read step

#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

hh<-read.delim('/Users/jus/household_power_consumption.txt',header=T,sep=';')
#       *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Add a specific MeasDate variable holding the date.
hh$MeasDate<-as.Date(hh$Date,"%d/%m/%Y")

hhsub<-hh[hh$MeasDate>=as.Date('01/02/2007','%d/%m/%Y') & hh$MeasDate<=as.Date('02/02/2007','%d/%m/%Y'),]


