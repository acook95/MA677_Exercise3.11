options(digits=2, scipen=999)
fijiquakes <- read_table2("fijiquakes.csv")


cdf_quakes<- ecdf(fijiquakes$mag)
plot.ecdf(cdf_quakes)

cdf_quakes(4.9)
cdf_quakes(4.3)
cdf_quakes(4.9) - cdf_quakes(4.3)

##  look at ecdf(fijiquakes$mag)

n <- length(fijiquakes$mag)
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
E_x <-  cdf_quakes(4.9)
V_x <- (cdf_quakes(4.9)*(1 - cdf_quakes(4.9)))/n

SD_x <- sqrt(V_x)

2*SD_x

