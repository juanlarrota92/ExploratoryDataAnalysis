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
## Making Plot
plot(sdata$Global_active_power~sdata$Datetime, type="l", ylab= "Global Active Power (kilowatts)", xlab="")
## Save plot in png format
dev.copy(png, file = "plot2.png",width=480, height=480)
dev.off()
