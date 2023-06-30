library(ggplot2)

hospital <- read.table("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/Finals/hospital.txt", header = TRUE)
hospital

# --------------------(a)----------------------
# Scatterplot of expadm vs. los
ggplot(hospital, aes(x = los, y = expadm)) + 
  geom_point() +
  ggtitle("Scatterplot of expadm vs. los")

# Scatterplot of expadm vs. salary
ggplot(hospital, aes(x = salary, y = expadm)) + 
  geom_point() +
  ggtitle("Scatterplot of expadm vs. salary")

# --------------------(b)----------------------
# Fit the linear regression model
model <- lm(expadm ~ los, data = hospital)
summary(model)

# --------------------(c)----------------------
# Predict the average expense per admission at Fairyland Community Hospital
newdata <- data.frame(los = 6)
pred <- predict(model, newdata, interval = "prediction", level = 0.95)
pred

# --------------------(d)----------------------
# Test the null hypothesis that there is no linear relationship between expadm and los
# Using a significance level of 0.05
p_value <- summary(model)$coefficients[2, 4]
if (p_value < 0.05) {
  cat("There is a significant linear relationship between expense per admission and the length of stay.\n")
} else {
  cat("There is no significant linear relationship between expense per admission and the length of stay.\n")
}

# --------------------(e)----------------------
# Plot of residuals
ggplot(model, aes(x = fitted.values(model), y = residuals(model))) + 
  geom_point() + 
  xlab("Fitted values") + 
  ylab("Residuals")+ 
  ggtitle("Scatterplot of Residuals")

# Normal probability plot of residuals
qqnorm(model$residuals, ylab= "Residuals", main = "Normal Probability Plot of Residuals")
qqline(model$residuals)

# --------------------(f)----------------------
# Fit the linear regression model
model_lm <- lm(expadm ~ los + salary, data = hospital)
summary(model_lm)