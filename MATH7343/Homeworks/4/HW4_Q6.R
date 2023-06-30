library(haven)
twins <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/4/twins.dta")

t.test(twins$volume_1,twins$volume_2, mu=0, alternative="two.sided", conf.level=0.95, paired=TRUE)
