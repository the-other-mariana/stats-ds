#install.packages("e1071")
setwd('C:/Users/mariana/Documents/github-mariana/ECID1/stats-ds/week9')
library(e1071)
mydata = read.csv("demographics.csv")
income = mydata$income
variance = var(income) # equal moment two
m2 = moment(income, order=2, center=T)
m3 = moment(income, order=3, center=T)
sk_manually = m3 / ((sqrt(m2))^3)
sk = skewness(income)
k = kurtosis(income, type=1) + 3
variance
m2
sk
sk_manually
k
