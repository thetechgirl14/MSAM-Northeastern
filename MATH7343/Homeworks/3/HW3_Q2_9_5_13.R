library(haven)
serum_zinc <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/3/serum_zinc.dta")

# Confidence Interval for the mean
mean_zinc <- mean(serum_zinc$zinc)
std_dev <- sd(serum_zinc$zinc) / sqrt(nrow(serum_zinc))

# 95% Confidence Interval
alpha <- 0.05
z_critical <- qnorm(1 - alpha/2)
CI_95 <- mean_zinc + c(-z_critical, z_critical) * std_dev
CI_95

# 90% Confidence Interval
alpha <- 0.1
z_critical <- qnorm(1 - alpha/2)
CI_90 <- mean_zinc + c(-z_critical, z_critical) * std_dev
CI_90

