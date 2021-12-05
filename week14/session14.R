setwd('C:/Users/mariana/Documents/github-mariana/ECID1/stats-ds/week14')

# binomial sample
rbinom(n=50, size=10, prob=0.25)
rbinom(n=50, size=10, prob=0.85)
# binom pdf plot
plot(x=c(0:10), y=dbinom(c(0:10), size=10, prob=0.25), ylim=c(0,1), xlim=c(-1,11), xlab="x", ylab="probability of x successes",main="Probability Function Binomial, n=10, p=0.25")

# binom pdf plot with lines
aux = rep(0,22) # repeat
aux[seq(2,22,2)] = dbinom(c(0:10), size=10, prob=0.5)
plot(x=c(0:10), y=dbinom(c(0:10), size=10, prob=0.5),
     ylim=c(0,1), xlim=c(-1,11), xlab="x", ylab="probability of x successes",
     main="Probability Function Binomial, n=10, p=0.5")
lines(x=rep(0:10, each=2), y=aux, type="h", lty=2, col="blue")

# binom cumulative distribution plot
x = c(0,10)
curve(pbinom(x, size=10, prob=0.5), xlim=c(-1,11), col="blue", ylab="Cumulative Ditribution", main="Ditribution Function, p=0.5")

# poisson random sample
rpois(n=100, lambda=3)

# poisson probability function plot
lambda = 5
n = 40

aux = rep(0, (n+1)*2)
aux[seq(2,(n+1)*2,2)] = dpois(c(0:n), lambda = lambda)

ymax = max(dpois(0:n, lambda=lambda))

#plot(x=c(0:n), y=dpois(c(0:n), lambda = lambda), ylim=c(0,ymax), xlim=c(-1,n+1), xlab="x", ylab="probability", main="Probability Function")
#lines(x=rep(0:n, each=2), y=aux, pch=21, type="h", lty=2, col="blue")