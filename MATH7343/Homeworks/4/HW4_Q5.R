library(haven)
bayley <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/4/bayley.dta")

pdi_mean <- mean(bayley$pdi)
pdi_std <- sd(bayley$pdi)

# 95% Confidence Interval for pdi
alpha <- 0.05
z_critical <- qnorm(1 - alpha/2)
z_critical
c(-z_critical, z_critical)
CI_95_pdi <- pdi_mean + c(-z_critical, z_critical) * (pdi_std/ sqrt(nrow(bayley)))
CI_95_pdi

mdi_mean <- mean(bayley$mdi)
mdi_std <- sd(bayley$mdi)

# 95% Confidence Interval for mdi
alpha <- 0.05
z_critical <- qnorm(1 - alpha/2)
CI_95_mdi <- mdi_mean + c(-z_critical, z_critical) * (mdi_std/ sqrt(nrow(bayley)))
CI_95_mdi