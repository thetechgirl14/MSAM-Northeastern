library(haven)
ischemic_hd <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/8/ischemic_hd.dta")
ischemic_hd

plot(time ~ duration, data = ischemic_hd, main = "Scatter Plot - Duration vs Time", xlab = "Duration", ylab = "Time")

hist(ischemic_hd$time,main = "Histogram Plot - Time", xlab = "Time", ylab = "Frequency")
hist(ischemic_hd$duration,main = "Histogram Plot - Duration", xlab = "Duration", ylab = "Frequency")

perm.cor.test <- function(x, y, n.perm=100000, cor.method="spearman")
{
n <- length(x)
T.obs <- cor(x, y, method=cor.method)
T.perm = rep(NA, n.perm)
for(i in 1:n.perm)
	{y.perm = sample(y, n, replace=F)
T.perm[i] = cor(x, y.perm, method=cor.method)}
mean(abs(T.perm) >= abs(T.obs))
} 

perm.cor.test(ischemic_hd$time, ischemic_hd$duration, cor.method = "pearson")
perm.cor.test(ischemic_hd$time, ischemic_hd$duration, cor.method = "spearman")
              
