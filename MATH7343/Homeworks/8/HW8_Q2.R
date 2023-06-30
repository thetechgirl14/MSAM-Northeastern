library(haven)
prison <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/8/prison.dta")
prison


OR <- 9.39
df <- 1
alpha <- 0.05
ln_OR <- log(OR)
ln_OR_error <- sqrt(87.502/df)
OR_lower <- exp(ln_OR – z*sqrt(ln_OR_error^2 + ln_OR_error^2))
OR_upper <- exp(ln_OR – z*sqrt(ln_OR_error^2 + ln_OR_error^2))
