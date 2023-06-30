cytomegalo <- read.csv("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/Finals/cytomegalo.csv")
cytomegalo

# --------------------(a)----------------------
table(cytomegalo$group, cytomegalo$death)

# --------------------(b)----------------------
library(survival)
fit <- survfit(Surv(time, death) ~ group, data = cytomegalo)
summary(fit)

# --------------------(c)----------------------
plot(fit, xlab = "Time in months", ylab = "Survival probability", main = "Survival Curves by Treatment Group",
     col = c("blue", "red"), lty = c(1, 2))
legend("bottomright", legend = c("Group 0", "Group 1"), lty = c(1, 2), col = c("blue", "red"))

# --------------------(e)----------------------
survdiff(Surv(time, death) ~ group, data = cytomegalo)
