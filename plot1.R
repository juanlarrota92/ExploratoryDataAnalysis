## Load data into R
data = read.csv("~/Rstudio/household_power_consumption.txt", sep=";", na.strings="?")
##convert  Date and Time variables to Date/Time classes in R
data$Date = as.Date (data$Date,"%d/%m/%Y")
## Subset data from the dates 2007-02-01 and 2007-02-02
sdata= subset(data, Date >="2007-02-01" & Date <="2007-02-02")
## Making Plot
hist(sdata$Global_active_power,xlab= "Global Active Power (kilowatts)",main="Global Active Power", col="red" )
## Save plot in png format
dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off()
