nobs <- 8000
lambda <- 3
df1 <- 5
df2 <- 3

X <- rpois(nobs, lambda)
Y <- rf(nobs, df1, df2)

mean(X^3 / Y)
