library(dplyr)
library(ggplot2)
library(tidyr)
library(tidyverse)
install.packages('plotly')
library(plotly)
install.packages('DMwR')
library(DMwR)
library(lubridate)
install.packages('fastDummies')
library(fastDummies)
install.packages("corrplot")
library(corrplot)

loan <- read.csv('train.csv')
str(loan)
table(loan$loan_default)
prop.table(table(loan$loan_default))

str(loan.train)

ggplot(loan,aes(x=loan_default)) + geom_bar()
plot_ly(data=loan,x=~loan_default,type = 'bar')

smote.data <- SMOTE(loan_default ~ ., loan, perc.over = 100, perc.under=200)

loan.train <- loan[,c(1:4,9:11,16,19,21:27,36,37,41)]

loan.train$Date.of.Birth <- as.Date(loan.train$Date.of.Birth,format="%d/%m/%Y")
loan.train$Date.of.Birth

names(loan.train)
str(loan.train$Employment.Type)
levels(loan.train$Employment.Type)


loan.train.d <- fastDummies::dummy_cols(loan.train,select_columns = c('Passport_flag',
                                                                      'PAN_flag','Employment.Type'))
names(loan.train.d)


clean.data <- read.csv('Data_train.csv')
clean.data <- clean.data[,-12]
#clean.data$PAN_flag <- as.factor(clean.data$PAN_flag)
#clean.data$Passport_flag <- as.factor(clean.data$Passport_flag)

str(clean.data)
names(clean.data)

data <- fastDummies::dummy_cols(clean.data,select_columns = c('Employment.Type'))
data <- data[,-c(1,7)]
str(data)


head(clean.data$Employment.Type,n=50)

heatmap(data)






