#setwd("C:\\Users\\mariana\\Documents\\github-mariana\\ECID1\\stats-ds\\week6")
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

salary = data$income
breaks = seq(0, 1150, by=50)
length(breaks)
breaks

salary_cut = cut(salary, breaks, right=FALSE)
str(salary_cut)
head(salary_cut)
levels(salary_cut)
temp = cbind(data$income, salary_cut)
temp

salaryTable = table(salary_cut)
barplot(salaryTable, main="Income")

# age
age = data$age
breaks = seq(18, 76, by=5)
length(breaks)
breaks

age_cut = cut(age, breaks, right=FALSE)
str(age_cut)
head(age_cut)
levels(age_cut)
temp = cbind(data$income, age_cut)
temp

age_t = table(age_cut)
barplot(age_t, main="Age")
which.min(age_t)
which.max(age_t)

# carpr
# 1
carpr = data$carpr
range(carpr)
breaks1 = seq(0, 100, by=4)
hist(carpr, breaks=breaks1, right=FALSE)
