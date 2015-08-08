# Plot3.R
# jmendez

# project 1 Plot 3  exploratory data
setwd("/home/jmendez")
#
data=read.csv('household_power_consumption.txt',header=TRUE,sep=";",dec='.',na.strings='?')
# asecurying Date type
data[,1]=as.Date(data[,1],'%d/%m/%Y')
#
# extracting requiered data
data2=data[year(data[,1])==2007 & months(data[,1])=='February' & ( day(data[,1])=='1' | day(data[,1])=='2'),]

#Plot 2, an histogram'
plot(data2[,7], ylab='Energy Sub metering', xlab='', type='l' )
lines(data2[,8])
lines(data2[,9])
legend('topright','Sub Mettering 1','Sub Metering 2',pch=20)
legend('topright','Sub Mettering 2',pch=20)
legend('topright','Sub Mettering 3',pch=20)