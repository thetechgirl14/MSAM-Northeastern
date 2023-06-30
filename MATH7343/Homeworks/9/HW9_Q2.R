library(haven)

lowbwt <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/9/lowbwt.dta")

# ------------(a)------------
plot(sbp ~ apgar5, data = lowbwt, main = "Scatter Plot - Systolic BP vs 5 min Apgar Score", ylab = "Systolic Blood Pressure", xlab = "5 Min Apgar score")

# ------------(b)------------
fit <- lm(sbp ~ gestage + apgar5, data=lowbwt)
summary(fit)

# ------------(c)------------
newdata <- data.frame(gestage = 31, apgar5 = 7)
predict(fit, newdata=newdata, interval="confidence", level=0.95)

# ------------(d)------------
summary(fit)$coefficients["apgar5", "Pr(>|t|)"]

# ------------(e)------------
summary(fit)$r.squared

# ------------(f)------------
plot(fit$residuals, fit$fitted.values, main = "Scatter Plot - Residuals vs Fitted Values", xlab = "Fitted values", ylab = "Residuals")

# ------------(g)------------
fit2 <- lm(sbp ~ gestage + sex, data=lowbwt)
summary(fit2)

# ------------(h)------------
plot(lowbwt$gestage[lowbwt$sex == 1], lowbwt$sbp[lowbwt$sex == 1], 
     col = "blue", xlab = "Gestational Age", ylab = "Systolic Blood Pressure", 
     main = "Systolic Blood Pressure by Gestational Age and Sex")
points(lowbwt$gestage[lowbwt$sex == 0], lowbwt$sbp[lowbwt$sex == 0], 
       col = "red")
abline(lm(sbp ~ gestage, data = lowbwt[lowbwt$sex == 1, ]), col = "blue")
abline(lm(sbp ~ gestage, data = lowbwt[lowbwt$sex == 0, ]), col = "red")
legend("topleft", legend = c("Male", "Female"), col = c("blue", "red"), pch = 1)

# ------------(i)------------
fit3 <- lm(sbp ~ gestage + sex + gestage:sex, data = lowbwt)
summary(fit3)

# ------------(j)------------
anova(fit2, fit3)
