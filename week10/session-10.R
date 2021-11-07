setwd('C:/Users/mariana/Documents/github-mariana/ECID1/stats-ds/week10')
mydata = read.csv("demographics.csv")

agecol = mydata$age
incomecol = mydata$income

qqnorm(agecol, pch=1, frame=T)
qqline(agecol, col='magenta', lwd=2)