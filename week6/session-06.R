setwd("C:\\Users\\mariana\\Documents\\github-mariana\\ECID1\\stats-ds\\week6")
#install.packages("tidyverse")
mydata = read.csv("demographics.csv", stringsAsFactors = TRUE)
str(mydata)
summary(mydata)
educ = mydata$educ
educ_t = table(educ)
educ_t
max(educ_t)
min(educ_t)

barplot(educ_t, main = "Education")
cbind(educ_t)

salary = mydata$income
breaks = seq(0, 1150, by=50)
length(breaks)
breaks

salary_cut = cut(salary, breaks, right=FALSE)
str(salary_cut)
head(salary_cut)
levels(salary_cut)
temp = cbind(mydata$income, salary_cut)
temp

salaryTable = table(salary_cut)
barplot(salaryTable, main="Income")

# age
age = mydata$age
breaks = seq(18, 76, by=5)
length(breaks)
breaks

age_cut = cut(age, breaks, right=FALSE)
str(age_cut)
head(age_cut)
levels(age_cut)
temp = cbind(mydata$income, age_cut)
temp

age_t = table(age_cut)
barplot(age_t, main="Age")
which.min(age_t)
which.max(age_t)

# carpr
# 1
carpr = mydata$carpr
range(carpr)
breaks1 = seq(4, 100, by=3)
hist(carpr, breaks=breaks1, right=FALSE)
