# histogram of relative cumulative function

mydata = faithful
erup = mydata$eruptions
bins = 100
str(erup)
min(erup)
max(erup)

breaks1 = seq(1, 6, by=0.1)
erupt = hist(erup, breaks=breaks1, right=FALSE)
reldata = erupt$counts / nrow(mydata)
min(reldata)
max(reldata)
cumfreq = cumsum(reldata)
plot(cumfreq, main='Eruptions', xlab='Minutes', ylab='Cumulative Relative Frecuency')
lines(cumfreq)