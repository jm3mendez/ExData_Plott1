# Plot4.R
# jmendez

# project 1 Plot 4  exploratory data
setwd("/home/jmendez")
#
data=read.csv('household_power_consumption.txt',header=TRUE,sep=";",dec='.',na.strings='?')
# asecurying Date type
data[,1]=as.Date(data[,1],'%d/%m/%Y')
#
# extracting requiered data
data2=data[year(data[,1])==2007 & months(data[,1])=='February' & ( day(data[,1])=='1' | day(data[,1])=='2'),]

#Plot 2, an histogram'
par('cex.lab'=0.9)
par('cex'=0.8)

### PLot


myplot <- function(data2) {
  par(cex.lab=1,cex=1)
  par(mfcol=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0),cex=0.6)

  plot(data2[,3], ylab='Global Active Power', xlab='', type='l',xaxt='n' )
  axis(side=1,at=c(1,(ndat/2),(ndat-1)),labels=c('Thu','Fri','Sat'))
  
  plot(data2[,7], ylab='Energy sub metering', xlab='', type='l',xaxt='n' )
  lines(data2[,8],col='red')
  lines(data2[,9],col='blue')
  legend('topright',c('Sub Mettering 1','Sub Metering 2','Sub Metering 3'),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c('black','red','blue'),cex=0.5,bty='n')
  axis(side=1,at=c(1,(ndat/2),(ndat-1)),labels=c('Thu','Wed','Fri'),lwd=0.7)

  plot(data2[,5], ylab='Voltage', xlab='datetime', type='l',xaxt='n' )
  axis(side=1,at=c(1,(ndat/2),(ndat-1)),labels=c('Thu','Fri','Sat'))

  plot(data2[,4], ylab='Global Reactive Power', xlab='datetime', type='l',xaxt='n' )
  axis(side=1,at=c(1,(ndat/2),(ndat-1)),labels=c('Thu','Fri','Sat'))
}

myplot(data2)

#
library(grDevices)
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)
myplot(data2)
dev.off()

