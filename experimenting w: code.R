
### code from Haviland's demo

options(digits = 3, scipen = 999)

p <- dbinom(5,10,.3)
p

x <- dbinom(0:10, 10, .3)
round(x, digits = 3)
plot(x)
cumsum(x)

y <- pbinom(0:10, 10, .3)
y
plot(y)

inv <- qbinom(y, 10, .3)
inv

samp <- rbinom(100000, 10, .3)
hist(samp)

library(ggplot2)

head(samp)

samp1 <- as.data.frame(samp)
dim(samp1)
plot1 <- ggplot(samp1, aes(x=samp))
plot1 + geom_histogram()



### experimenting with code for 3.11
options(digits = 3, scipen = 999)
set.seed(1)
n <- 100
p0 <- 0.6
p1 <- 0.8
x <- pbinom(0:100, n, p0)
x
plot(x, type = "l")

y <- pbinom(0:100, n, p1)
plot(y, type = "l")

plot(x, type = "l")
lines(y, type = "l")

z <- dbinom(0:100, n, p0)
z
plot(z)

for (i in 0:n) {
  alpha <- 1 - pbinom(i, n, p0)
  if (alpha < 0.05) break
}
m0 <- i
m0

for (i in 0:n) {
  beta <- pbinom(i, n, p1)
  if (beta > 0.05) break
}
m1 <- i
m1


plot(x, type = "l")
lines(y, type = "l")
segments(60, 0.05, 80, 0.05)
segments(60, 0.05, 60, 0.95)
segments(60, 0.95, 80, 0.95)
segments(80, 0.95, 80, 0.05)



for (i in seq(from = 0.4, to = 1, by = 0.001)) {
  pwr <- pbinom(m0, size = 100, prob = i)
}
plot(pwr)

pwr <- pbinom(m0, 100, prob = seq(from = 0.4, to = 1, by = 0.01))
plot(pwr)


pwr1 <- cumsum(dbinom(m0, 100, prob = seq(from = 0, to = 1, by = 0.01)))
plot(pwr1, type = "l")

pwr2 <- cumsum(dbinom(m1, 100, prob = seq(from = 0, to = 1, by = 0.01)))
plot(pwr2, type = "l", ylab = "power", xlim = c(40,100), ylim = c(0,1))
lines(pwr1, type = "l", xlab = "probability * 100")
segments(60, 0.05, 80, 0.05)
segments(60, 0.05, 60, 0.95)
segments(60, 0.95, 80, 0.95)
segments(80, 0.95, 80, 0.05)

