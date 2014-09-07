## Load data into R
data = read.csv("~/Rstudio/household_power_consumption.txt", sep=";", na.strings="?")
##convert  Date and Time variables to Date/Time classes in R
data$Date = as.Date (data$Date,"%d/%m/%Y")
## Subset data from the dates 2007-02-01 and 2007-02-02
sdata= subset(data, Date >="2007-02-01" & Date <="2007-02-02")
Sys.setlocale("LC_TIME", "English")
## Set the weekdays for each date 
sdata$Datetime=weekdays(sdata$Date)
## Converting the dates
datetime <- paste(as.Date(sdata$Date), sdata$Time)
sdata$Datetime <- as.POSIXct(datetime)
## Making plot
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(sdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
## Save plot in png format
dev.copy(png, file = "plot4.png",width=480, height=480)
dev.off()    
