setwd('C:/Users/mariana/Documents/github-mariana/ECID1/stats-ds/exam')
library(e1071)
library(corrplot)
library(MASS)
library(carData)

#
mydata = read.csv("starwarsSmall.csv")
str(mydata)
typeof(mydata$height)
typeof(mydata$mass)
typeof(mydata$hair_color)
typeof(mydata$gender)
typeof(mydata$birth_year)

# 
x = mydata$eye_color
x_table = table(x)
x_table
barplot(x_table)
min(x_table)
which.min(x_table)
mins = names(x_table)[which(x_table==min(x_table))]
mins

#
mydata = UScereal
prot = mydata$protein
sug = mydata$sugars
pot = mydata$potassium
range(prot)
h=hist(prot, breaks=seq(from=0, to=15, by=1))

#
pcut = cut(prot, breaks=seq(from=0, to=15, by=1), right=F) # same params as hist()
ptable = table(pcut)
barplot(ptable)
mode1 = names(ptable)[which(ptable==max(ptable))]
ptable
mode1
mean(prot)
median(prot)
skewness(prot)

range(sug)
hist(sug, breaks=seq(from=0, to=21, length=15))
pcut = cut(sug, breaks=seq(from=0, to=21, length=15), right=F) # same params as hist()
ptable = table(pcut)
barplot(ptable)
mode1 = names(ptable)[which(ptable==max(ptable))]
ptable
mode1
mean(sug)
median(sug)
skewness(sug)

range(pot)
pcut = cut(pot, breaks=seq(from=14, to=1000, length=15), right=F) # same params as hist()
ptable = table(pcut)
barplot(ptable)
mode1 = names(ptable)[which(ptable==max(ptable))]
ptable
mode1
mean(pot)
median(pot)
skewness(pot)

#hist(pot, breaks=seq(from=14, to=1000, length=15))


mydata = read.csv("Vitamin3.csv")
eff = mydata$effort
mean(eff)

#
mydata = Florida
str(Florida)
bush = mydata$BUSH
gore = mydata$GORE
moore = mydata$MOOREHEAD

IQR(bush)
quantile(bush)
#boxplot(bush, horizontal=T, main="Bush")
IQR(gore)
quantile(gore)
#boxplot(gore, horizontal=T, main="Gore")
IQR(moore)
quantile(moore)
boxplot(moore, horizontal=T, main="Moorehead")