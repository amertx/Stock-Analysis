#initial installation of libraries
install.packages("quantmod")
install.packages("ggplot2")

#loading libraries
library(quantmod)
library(ggplot2)

#user prompt to ask for ticker symbol
tickerInput <- readline(prompt="Enter a ticker symbol you would like to use for the prices series: ")

#creating an xts object
tickerAnalysis <-getSymbols(tickerInput, src = "yahoo", from="2020-02-01", to= "2020-05-01",auto.assign = FALSE)

#retrieving of 6 days of data using the "from date"
head(tickerAnalysis)

#retrieving of 6 days of data using the "to date"
tail(tickerAnalysis)

#summary ticker symbol
summary(tickerAnalysis)

#using the ggplot library, i am able to show 3 month history of data relating to the prices series of the user's ticker symbol
#prices series includes dividend distribution and prices margins throughout the duration set above
ggplot(tickerAnalysis,aes(x=index(tickerAnalysis),y=tickerAnalysis[,6])) + geom_line(color="green")+ ggtitle("Boeing Price Series") + xlab("Date") + ylab("Prices") + theme(plot.title = element_text(hjust = 0.5)) + scale_x_date(date_labels = "%b %y", date_breaks = "1 months")
