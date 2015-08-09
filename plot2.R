# Plot2.R
# jmendez

# project 1 Plot 2  exploratory data
setwd("/home/jmendez")
#
data=read.csv('household_power_consumption.txt',header=TRUE,sep=";",dec='.',na.strings='?')
# asecurying Date type
data[,1]=as.Date(data[,1],'%d/%m/%Y')
#
# extracting requiered data

data2=data[year(data[,1])==2007 & months(data[,1])=='February' & ( day(data[,1])=='1' | day(data[,1])=='2'),]
ndat=dim(data2)[1]
#Plot 2, an Plot

myplot <- function(data2) {
  par(mfcol=c(1,1))
  par('cex.lab'=0.9)
  par('cex'=0.8)
  plot(data2[,3], ylab='Global Active Power (kilowatts)', xlab='', type='l',xaxt='n' )
  axis(side=1,at=c(1,(ndat/2),(ndat-1)),labels=c('Thu','Fri','Sat'))
}
 
myplot(data2)

library(grDevices)
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)
myplot(data2)
dev.off()