# 1.1
manzanas = rnorm(500, mean=200, sd=30)
manzanas
# 1.2
sel1 = manzanas[manzanas>=170]
sel2 = sel1[sel1 <= 230]
sel2
perc = length(sel2)/length(manzanas)*100
perc
# 1.3
naranjas = rnorm(300, mean=150, sd=45)
naranjas
# 1.4
sel3 = naranjas[naranjas>=105]
sel4 = sel3[sel3 <= 195]
sel4
perc2 = length(sel4)/length(naranjas)*100
perc2

# 2.1
con = rnorm(400, mean=30, sd=14)
mean1 = mean(con)
median1 = median(con)
range1 = range(con)[2] - range(con)[1]
iqr1 = IQR(con)
sd1 = sd(con)
mean1
median1
range1
iqr1
sd1

con2 = con*3 + 3
mean2 = mean(con2)
median2 = median(con2)
range2 = range(con2)[2] - range(con2)[1]
iqr2 = IQR(con2)
sd2 = sd(con2)
mean2
median2
range2
iqr2
sd2

con
con2

plot(x=c(min(con):max(con)), y=dnorm(c(min(con):max(con)), mean=30, 14),
     xlab="x", ylab="probability", main=c("P(x) of con"))

plot(x=c(min(con2):max(con2)), y=dnorm(c(min(con2):max(con2)), mean=93, 42),
     xlab="x", ylab="probability", main=c("P(x) of con2"))

x = c(min(con):max(con))
curve(pnorm(x, mean=30, sd=14), xlim=c(min(con),max(con)), col="blue", ylab="Cumulative Ditribution",
      main="Ditribution Function")

x = c(min(con2):max(con2))
curve(pnorm(x, mean=93, sd=42), xlim=c(min(con2),max(con2)), col="blue", ylab="Cumulative Ditribution",
      main="Ditribution Function")

