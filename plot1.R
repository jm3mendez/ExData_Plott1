# Plot1.R
# jmendez
# OK

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

myplot <- function(data2) {
par(mfcol=c(1,1))
par('cex.lab'=0.9)
par('cex'=0.8)
hist(data2[,3],xlab='Global Active Power (kilowatts)',main='Global Active Power', col="red")
}

myplot(data2)

library(grDevices)
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)
myplot(data2)
dev.off()


