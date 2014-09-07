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
plot(sdata$Sub_metering_1~sdata$Datetime,type="l",ylab="Energy sub metering", xlab="")
lines(sdata$Sub_metering_2~sdata$Datetime,type="l",col="red")
lines(sdata$Sub_metering_3~sdata$Datetime,type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1, lwd=2)
## Save plot in png format
dev.copy(png, file = "plot3.png",width=480, height=480)
dev.off()