# bernoulli
# random samples
p_success = 0.25
rbinom(n=50, size=1, prob=p_success)

p_success = 0.85
rbinom(n=50, size=1, prob=p_success)

# plot pdf
plot(x=c(0:1), y=dbinom(c(0:1), size=1, prob=0.25), ylim=c(0,1), xlim=c(-1,2),
     xlab="x", ylab="probability", main=c("F(x) of Bernoulli"))
lines(x=c(0,0,1,1), y=c(0,0.75,0,0.25), type="h", lty=2, col="blue")

# plot cumulative pdf
curve(pbinom(x, size=1, prob=0.25), xlim=c(-1,2), col="blue", 
      ylab="Cumulative Distribution", main=c("F(x) of Bernoulli"))