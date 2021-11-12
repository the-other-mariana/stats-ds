setwd('C:/Users/mariana/Documents/github-mariana/ECID1/stats-ds/week9')
library(e1071)
library(corrplot)
mydata = faithful
x = mydata$eruptions
var(x)
moment(x, order=2, center=T)
sum((x-mean(x))^2)/length(x)
mean(x)
median(x)
# for mode
range(x)
breaks1 = seq(1, 6, by=0.5)
x_cut = cut(x, breaks=breaks1, right=F)
x_table = table(x_cut)
mode_erup = names(x_table)[which(x_table==max(x_table))]
mode_erup
barplot(x_table, main='Eruptions')
sd(x)
cv = sd(x) / mean(x)
cv
skewness(x)
kurtosis(x) + 3
y = mydata$waiting
str(mydata)
cov(x,y)
cor(x,y)
M = cor(mydata)
M = round(M, 2) # M is the correlation matrix
corrplot(M, method="circle") # circle, square, ellipse, number, shade, color, pie