library(haven)
bayley <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/4/bayley.dta")

# Conduct two-sample t-test with equal variances on pdi
t.test(pdi ~ treatment, data = bayley, var.equal = TRUE)


# Conduct two-sample t-test with equal variances on mdi
t.test(mdi ~ treatment, data = bayley, var.equal = TRUE)
