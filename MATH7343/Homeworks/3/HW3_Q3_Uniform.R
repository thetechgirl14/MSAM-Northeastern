### A simulated example illustrating CLT
## Generate n=100 random variables from a Uniform(0,5) distribution
## Have n.obs=400 observations of each variable.
n <- 100
n.obs <- 400
rand.data3 <- matrix(runif(n.obs*n, min = 0, max = 5), nrow=n.obs)
## Create summary variables;
# v1--the first variable, mean2 -- average of the first two variables
# mean10 -- average of the first 10 variables, similarly mean30, etc.
v3 <- rand.data3[,1] #The first column (variable)
#Average of the first two columns(variables),
# apply function 'mean' on margin 1 (row-wise function application)
mean2 <- apply(rand.data3[,1:2], FUN=mean, MARGIN=1)
#Average of the first ten columns(variables)
mean10<- apply(rand.data3[,1:10], FUN=mean, MARGIN=1)
#Average of the first 30, 50, 100 columns (variables)
mean30 <- apply(rand.data3[,1:30], FUN=mean, MARGIN=1)
mean50 <- apply(rand.data3[,1:50], FUN=mean, MARGIN=1)
mean100 <- apply(rand.data3[,1:100], FUN=mean, MARGIN=1)
##Plot the histograms of the summary variables above, overlay with
# the density plot of the normal distribution in the CLT.
mu <- mean(rand.data3) #Poisson mean
sigma <- sd(rand.data3) #Poisson standard deviation
## Arrange 6 plots in one page 2 by 3
par(mfrow=c(2,3))
# Histogram of v2,
# then add the normal density curve in red color (col=2)
hist(v3, freq = FALSE, main="histogram when n=1")
curve(dnorm(x, mean=mu, sd=sigma),col=2,add=T)
# Histograms of mean2, mean10, ....
hist(mean2, freq = FALSE, main="histogram when n=2")
curve(dnorm(x, mean=mu, sd=sigma/sqrt(2)),col=2,add=T)
hist(mean10, freq = FALSE, main="histogram when n=10")
curve(dnorm(x, mean=mu, sd=sigma/sqrt(10)),col=2,add=T)
hist(mean30, freq = FALSE, main="histogram when n=30")
curve(dnorm(x, mean=mu, sd=sigma/sqrt(30)),col=2,add=T)
hist(mean50, freq = FALSE, main="histogram when n=50")
curve(dnorm(x, mean=mu, sd=sigma/sqrt(50)),col=2,add=T)
hist(mean100, freq = FALSE, main="histogram when n=100")
curve(dnorm(x, mean=mu, sd=sigma/sqrt(100)),col=2,add=T)