
## R3
dbinom(4, 7, .5) + dbinom(5, 7, .5) + dbinom(6, 7, .5) + dbinom(7, 7, .5)


1 - pbinom(3, 7, .5)
1 - pbinom(3, 7, .6)
1 - pbinom(3, 7, .7)


## R11

n <- 10
sample <- rep(0,1)
for (i in 1:n) {
  sample <- sample(x = 1:6, size = i, replace=TRUE)
}
sample
mean(sample)
var(sample)

n <- 1000
sample <- rep(0,1)
for (i in 1:n) {
  sample <- sample(x = 1:6, size = i, replace=TRUE)
}
sample
mean(sample)
var(sample)
