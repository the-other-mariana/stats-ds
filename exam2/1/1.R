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

# 4.1
# TECHNICIAN 1
p_success = 45/50
12*p_success
aux = rep(0,24) # repeat
aux[seq(2,24,2)] = dbinom(c(1:12), size=12, prob=p_success)
plot(x=c(1:12), y=dbinom(c(1:12), size=12, prob=p_success),
     ylim=c(0,1), xlim=c(0,13), xlab="x", ylab="probability of x successes",
     main="Probability Function Binomial, n=12, technician 1")
lines(x=rep(1:12, each=2), y=aux, type="h", lty=2, col="blue")

# TECHNICIAN 2
p_success = 29/35
12*p_success
aux = rep(0,24) # repeat
aux[seq(2,24,2)] = dbinom(c(1:12), size=12, prob=p_success)
plot(x=c(1:12), y=dbinom(c(1:12), size=12, prob=p_success),
     ylim=c(0,1), xlim=c(0,13), xlab="x", ylab="probability of x successes",
     main="Probability Function Binomial, n=12, technician 2")
lines(x=rep(1:12, each=2), y=aux, type="h", lty=2, col="blue")

# TECHNICIAN 3
p_success = 31/40
12*p_success
aux = rep(0,24) # repeat
aux[seq(2,24,2)] = dbinom(c(1:12), size=12, prob=p_success)
plot(x=c(1:12), y=dbinom(c(1:12), size=12, prob=p_success),
     ylim=c(0,1), xlim=c(0,13), xlab="x", ylab="probability of x successes",
     main="Probability Function Binomial, n=12, technician 3")
lines(x=rep(1:12, each=2), y=aux, type="h", lty=2, col="blue")

# 4.4
p_success = 45/50
p1 = dbinom(10, size=12, prob=p_success)
p1
p_success = 29/35
p2 = dbinom(10, size=12, prob=p_success)
p2
p_success = 31/40
p3 = dbinom(10, size=12, prob=p_success)
p3


# 4.5
x_value = 6
num_of_trials_in_event = 12
p_success = 45/50
p1 = pbinom(x_value, size=num_of_trials_in_event, prob=p_success) # F(X<=x)
p1
p_success = 29/35
p2 = pbinom(x_value, size=num_of_trials_in_event, prob=p_success) # F(X<=x)
p2
p_success = 31/40
p3 = pbinom(x_value, size=num_of_trials_in_event, prob=p_success) # F(X<=x)
p3

# 4.6
# NEW TECHNICIAN
p_success = 7/12
aux = rep(0,24) # repeat
aux[seq(2,24,2)] = dbinom(c(1:12), size=12, prob=p_success)
plot(x=c(1:12), y=dbinom(c(1:12), size=12, prob=p_success),
     ylim=c(0,1), xlim=c(0,13), xlab="x", ylab="probability of x successes",
     main="Probability Function Binomial, n=12, technician 4")
lines(x=rep(1:12, each=2), y=aux, type="h", lty=2, col="blue")

# 5.1
# low season
lambda = 20
n2 = 50
n1 = 5

aux = rep(0, (n2 -n1 +1)*2)
aux[seq(2,(n2 -n1 +1)*2,2)] = dpois(c(n1:n2), lambda = lambda)
ymax = max(dpois(n1:n2, lambda=lambda))

plot(x=c(n1:n2), y=dpois(c(n1:n2), lambda = lambda), ylim=c(0,ymax), xlim=c(-1,n2-n1+1),
     xlab="x", ylab="probability", main="Probability Function, Low")
lines(x=rep(n1:n2, each=2), y=aux, pch=21, type="h", lty=2, col="blue")
# summer season
lambda = 30
n2 = 50
n1 = 5

aux = rep(0, (n2 -n1 +1)*2)
aux[seq(2,(n2 -n1 +1)*2,2)] = dpois(c(n1:n2), lambda = lambda)
ymax = max(dpois(n1:n2, lambda=lambda))

plot(x=c(n1:n2), y=dpois(c(n1:n2), lambda = lambda), ylim=c(0,ymax), xlim=c(-1,n2-n1+1),
     xlab="x", ylab="probability", main="Probability Function, Summer")
lines(x=rep(n1:n2, each=2), y=aux, pch=21, type="h", lty=2, col="blue")
# december season
lambda = 40
n2 = 50
n1 = 5

aux = rep(0, (n2 -n1 +1)*2)
aux[seq(2,(n2 -n1 +1)*2,2)] = dpois(c(n1:n2), lambda = lambda)
ymax = max(dpois(n1:n2, lambda=lambda))

plot(x=c(n1:n2), y=dpois(c(n1:n2), lambda = lambda), ylim=c(0,ymax), xlim=c(-1,n2-n1+1),
     xlab="x", ylab="probability", main="Probability Function, December")
lines(x=rep(n1:n2, each=2), y=aux, pch=21, type="h", lty=2, col="blue")

# 5.2
dpois(35, lambda=20)
dpois(35, lambda=30)
dpois(35, lambda=40)

# 5.3
dpois(25, lambda=20)
dpois(25, lambda=30)
dpois(25, lambda=40)

# 5.5
ppois(35, lambda=20) - ppois(25, lambda=20)
ppois(35, lambda=30) - ppois(25, lambda=30)
ppois(35, lambda=40) - ppois(25, lambda=40)




