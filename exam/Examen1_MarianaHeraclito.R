
setwd("F:/DocumentsF/UP/1218_AD-2021/Estadistica/Exam1")
#4#
library(MASS)
prot = UScereal$protein
stem(prot)
sd(prot)
var(prot)

mydata = read.csv("Vitamin3.csv")
eff = mydata$effort
stem(eff)
sd(eff)
var(eff)

#5#
protM = mean(prot)
protSD = sd(prot)
protVariationCoeff = protSD/protM
mean(prot)
sd(prot)
protVariationCoeff

effM = mean(eff)
effSD = sd(eff)
effVariationCoeff = effSD/effM
mean(eff)
sd(eff)
effVariationCoeff

#6#

range(eff)
breaks = seq(3, 24, by=1.5)
effort_cut = cut(eff, breaks, right = FALSE)
effortTable = table(effort_cut)
effortCumulativeTable = cumsum(effortTable)
freqRelEffort = effortTable/sum(effortTable)*100
cumulativeTable = cumsum(freqRelEffort)
finalEffortTable = cbind(effortTable, effortCumulativeTable, freqRelEffort, cumulativeTable)
colnames(finalEffortTable) = c("Frequency", "Cumulative freq", "Relative freq", "Cumulative RelFreq")
finalEffortTable

#7#
#Q33 = 9 +((0.33*720-146)/100)*1.5 = 10.374
#Q67 = 13.5 +((0.67*720-450)/108)*1.5 = 13.95
quantile(eff, probs = c(0.33, 0.67))


#9#
library(e1071)
protSk = skewness(prot)
protKurt = kurtosis(prot, type = 1) + 3
hist(prot)
protSk
protKurt

protSk = skewness(prot)
protKurt = kurtosis(prot, type = 1) + 3
hist(prot)
protSk
protKurt

effortSk = skewness(eff)
effortKurt = kurtosis(eff, type = 1) + 3
hist(eff)
effortSk
effortKurt

#10#
hpData = mtcars$hp
carbData = mtcars$carb
wtData = mtcars$wt
mpgData = mtcars$mpg

plot(hpData, carbData)
hpCarbCov = cov(hpData, carbData)
hpCarbCor = cor(hpData, carbData)
hpCarbCov
hpCarbCor

plot(wtData, mpgData)
wtMpgCov = cov(wtData, mpgData)
wtMpgCor = cor(wtData, mpgData)
wtMpgCov
wtMpgCor