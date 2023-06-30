library(haven)
insure <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/6/insurance.dta")

insured_women <- subset(insure, insure$group == 0)

summary(insured_women)

uninsured_women <- subset(insure, insure$group == 1)
summary(uninsured_women)

wilcox.test(insured_women$stage, uninsured_women$stage)