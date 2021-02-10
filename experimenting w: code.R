options(digits = 3, scipen = 999)

p <- dbinom(5,10,.3)
p

x <- dbinom(0:10, 10, .3)
round(x, digits = 3)
plot(x)
cumsum(x)

y <- pbinom(0:10, 10, .3)
y

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
