library(haven)
coffee <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/10/coffee.dta")

# ------------(a)------------
# Fit a logistic regression model
model <- glm(mi ~ coffee, data = coffee, family = binomial(link = "logit"))
summary(model)
exp(model$coefficients[2])

# ------------(b)------------
# Fit separate logistic regression models for smokers and nonsmokers
model_smokers <- glm(mi ~ coffee, data = subset(coffee, smoke == 1), family = binomial(link = "logit"))
summary(model_smokers)
exp(model_smokers$coefficients[2])

model_nonsmokers <- glm(mi ~ coffee, data = subset(coffee, smoke == 0), family = binomial(link = "logit"))
summary(model_nonsmokers)
exp(model_nonsmokers$coefficients[2])

# ------------(c)------------
# Fit a logistic regression model adjusting for smoking status
model_adj <- glm(mi ~ coffee + smoke, data = coffee, family = binomial(link = "logit"))
summary(model_adj)
exp(model_adj$coefficients[2])

# ------------(d)------------
# Test the null hypothesis that the odds ratio associated with coffee consumption is equal to 1
summary(model)
test <- summary(model)$coefficients["coffee", "Pr(>|z|)"]
test

# ------------(e)------------
# 95% confidence interval for odds ratio
confint(model_adj, level = 0.95)




