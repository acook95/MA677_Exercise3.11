library(e1071)

set.seed(421)
x1 = runif(500) - 0.5
x2 = runif(500) - 0.5
y = 1 * (x1^2 - x2^2 > 0)
plot(x1[y==0], x2[y==0], col="red", xlab="X1", ylab="X2", pch="+")
points(x1[y==1], x2[y==1], col="blue", pch=4)
traindata = data.frame(x1=x1, x2=x2, y=y)


predmat<- expand.grid(x1=x1seq,x2=x2seq)
plot(traindata$x1,traindata$x2, xlab="X1", ylab="X2")
points(predmat$x1, predmat$x2, col=ifelse([glm.pred] ==1,rgb(0,0,1,alpha=0.3),
                                          rgb(1,0,0,alpha=0.3)),pch=19)


model1 <- svm(y~x1 + x2, data = traindata, kernel = "linear")
model1

plot(model1)

model2 <- glm(y ~ x1 + x2, data = traindata, family = binomial(link = "logit"))
model2


