# Generic Google Trend library script; 
# args used for keywords and dates;
# Script intended for comparing the amount of search results between two dates (today_date and comparison_date)
# the return value of the script is the amount of searches for the same keyword in two different dates today_result and comparison_result.

library("gtrendsR")

#Get parameters
args <- commandArgs()
keywords<-c(args[6])
today_date<-as.Date(args[7])
comparison_date<-as.Date(args[8])
internal_directory<-args[9]

internal_directory=trimws(internal_directory,"l","file:///")

#set search time to 5 years ago
time="today+5-y"

#Get over_time gtrend's dataframe
trends = gtrends(keywords,time = time)
df <- as.data.frame(trends$interest_over_time)

#Set date column 'date' to Date data type
df$date <- as.Date(df$date)

#Get hit value using dates as parameters
comparison_result = subset(df,date==comparison_date)
today_result = subset(df,date==today_date)

write.csv(comparison_result$hits,paste(internal_directory,"/cResults.csv",sep=""))
write.csv(today_result$hits,paste(internal_directory,"/tResults.csv",sep=""))