programmer <- read.table("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/Finals/programmer.txt", header = TRUE)
programmer

# --------------------(a)----------------------
model <- glm(success ~ Experience, data = programmer, family = binomial)
summary(model)

# --------------------(b)----------------------
confint(model, level = 0.95)

# --------------------(c)----------------------
probability <- predict(model, newdata = data.frame(Experience = 24), type = "response")
probability
salary <- ifelse(probability == 1, 90000, 
          ifelse(probability >= 0.8, 72000, 
          (probability * 90000)))
salary

# --------------------(d)----------------------
prob18 <- predict(model, newdata = data.frame(Experience = 18))
time <- exp(prob18) / (1 + exp(prob18))
time
