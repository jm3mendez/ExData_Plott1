# Plot1.R
# jose mendez

# project 1 Plot 1  exploratory data
setwd("/home/jmendez")
#
data=read.csv('household_power_consumption.txt',header=TRUE,sep=";",dec='.',na.strings='?')
# asecurying Date type
data[,1]=as.Date(data[,1],'%d/%m/%Y')
#
# extracting requiered data
data2=data[year(data[,1])==2007 & months(data[,1])=='February' & ( day(data[,1])=='1' | day(data[,1])=='2'),]

#Plot 1, an histogram

hist(data2[,3],xlab='Global Active Power (kilowatts)',main='Global Active Power')
