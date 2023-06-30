library(haven)
lowbwt <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/9/lowbwt.dta")

# ------------(a)------------
plot(sbp ~ gestage, data = lowbwt, main = "Scatter Plot - Systolic BP vs Gestational Age", ylab = "Systolic Blood Pressure", xlab = "Gestational Age")

# ------------(b)------------
# Fit the regression model
model <- lm(sbp ~ gestage, data = lowbwt)
summary(model)

# ------------(e)------------
# Construct the confidence interval
newdata <- data.frame(gestage = 31)
predict(model, newdata, interval = "confidence", level = 0.95)


# ------------(f)------------
predicted_sbp <- predict(model, newdata)
predicted_sbp

# ------------(g)------------
predict(model, newdata, interval = "prediction")

# ------------(h)------------
model_summary <- summary(model)
model_summary$r.squared

# ------------(j)------------
plot(model$residuals, model$fitted.values, main = "Scatter Plot - Residuals vs Fitted Values", xlab = "Fitted values", ylab = "Residuals")

