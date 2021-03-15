
### QUESTION 1 ###

options(digits=6, scipen=999)
fijiquakes <- read_table2("fijiquakes.csv")

cdf_quakes<- ecdf(fijiquakes$mag)
plot.ecdf(cdf_quakes)

cdf_quakes(4.9)
cdf_quakes(4.3)
cdf_quakes(4.9) - cdf_quakes(4.3)

n <- length(fijiquakes$mag)
n
alpha =  .05
x <- seq(0, max(fijiquakes$mag), length=n)
fx <- cdf_quakes(x)

epsilon <- sqrt((1/(2*n))*log(2/alpha))

L <- pmax(fx - epsilon, 0)
U <- pmin(fx + epsilon, 1)

plot.ecdf(cdf_quakes, pch=20)
lines(x, L, type="l", lty=1, col="red" )
lines(x, U, type="l", lty=1, col="red" )

## for x = 4.9
E_x1 <-  cdf_quakes(4.9)
V_x1 <- (cdf_quakes(4.9)*(1 - cdf_quakes(4.9)))/n

SD_x1 <- sqrt(V_x1)

2*SD_x1

E_x1 + .025
E_x1 - .025
# 95% confidence interval: 0.78 to 0.83

## for x = 4.3
E_x2 <- cdf_quakes(4.3)
V_x2 <- (cdf_quakes(4.3)*(1-cdf_quakes(4.3)))/n

SD_x2 <- sqrt(V_x2)

2*SD_x2

E_x2 + .028
E_x2 - .028
# 95% confidence interval: .25 to .3


## for 4.3 < x < 4.9
E_x3 <- cdf_quakes(4.9) - cdf_quakes(4.3)
V_x3 <- ((cdf_quakes(4.9) - cdf_quakes(4.3))*(1- (cdf_quakes(4.9) - cdf_quakes(4.3))))/n

SD_x3 <- sqrt(V_x3)

2*SD_x3

.526 + .032
.526 - .032

## 95% confidence interval: 0.49 to 0.56


### QUESTION 2 ###

geysers <- read_csv("geysers.csv")
cdf_geysers<- ecdf(geysers$waiting)
plot.ecdf(cdf_geysers)
n <- length(geysers$waiting)
n
alpha =  .05
x <- seq(0, max(geysers$waiting), length=n)
fx <- cdf_geysers(x)

epsilon <- sqrt((1/(2*n))*log(2/alpha))

L <- pmax(fx - epsilon, 0)
U <- pmin(fx + epsilon, 1)

plot.ecdf(cdf_geysers, pch=20)
lines(x, L, type="l", lty=1, col="red" )
lines(x, U, type="l", lty=1, col="red" )

mean(geysers$waiting) # 71 mins

se <- sd(geysers$waiting)/sqrt(length(geysers$waiting))

# 90% confidence interval: 69.65 to 72.25
mean(geysers$waiting) + 1.645*se
mean(geysers$waiting) - 1.645*se

median(geysers$waiting) # 76 mins



### QUESTION 3 ###

sample <- c(0.42, 0.06, 0.88, 0.40, 0.90,
            0.38, 0.78, 0.71, 0.57, 0.66,
            0.48, 0.35, 0.16, 0.22, 0.08,
            0.11, 0.29, 0.79, 0.75, 0.82,
            0.30, 0.23, 0.01, 0.41, 0.09)

cdf_sample <- ecdf(sample)
plot(cdf_sample)

ks.test(sample, punif, alternative = "two.sided")

func <- function(x){(x==0)*(0)+(0 < x & x <= .5)*(1.5*x)+(.5 < x & x < 1)*(.5 * x)+(x==1)*(0)}

ks.test(sample, func, alternative = "two.sided")

# The sample is from a different distribution than the pdf given


