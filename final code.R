# set sample size and probs for both aspirins
n <- 100
p0 <- 0.6
p1 <- 0.8

# find lower critical value
for (i in 0:n) {
  alpha <- 1 - pbinom(i, n, p0)
  if (alpha < 0.05) break
}
m0 <- i
m0

# find upper critical value
for (i in 0:n) {
  beta <- pbinom(i, n, p1)
  if (beta > 0.05) break
}
m1 <- i
m1

# create power curve for m = 68
pwr1 <- cumsum(dbinom(m0, 100, prob = seq(from = 0, to = 1, by = 0.01)))
plot(pwr1, type = "l")

# create power curve for m = 73
pwr2 <- cumsum(dbinom(m1, 100, prob = seq(from = 0, to = 1, by = 0.01)))

# plot both curves together with box
plot(pwr2, type = "l", ylab = "power", xlim = c(40,100), ylim = c(0,1))
lines(pwr1, type = "l", xlab = "probability * 100")
segments(60, 0.05, 80, 0.05)
segments(60, 0.05, 60, 0.95)
segments(60, 0.95, 80, 0.95)
segments(80, 0.95, 80, 0.05)
