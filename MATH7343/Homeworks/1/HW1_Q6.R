salary.data <- read.table(file = "C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/1/salary.txt", header = TRUE)
salary.data

# a) Histogram of the salaries using R default setting
hist(salary.data$SALARY)

# b) Histogram with break points (at least 15 intervals)
hist(salary.data$SALARY,
     breaks=90+(0:14)*12,
     main = "Histogram Plot - Salaries",
     xlab = "Salaries",
     ylab = "Frequency",
     border = FALSE,
     labels = TRUE,
     xlim = c(min(salary.data$SALARY), max(salary.data$SALARY)),
     ylim = c(0, 8),
     col = rainbow(15))

# c) Boxplot of the salaries
boxplot(salary.data$SALARY,
        main = "Box Plot - Salaries",
        xlab = "All genders",
        ylab = "Salaries",
        labels = TRUE,
        boxwex = 0.3,
        outline = TRUE,
        las = 1,
        notch = FALSE,
        staplewex = 1,
        col = "green")

# d) Boxplots of the salaries in two gender groups
boxplot(SALARY~GENDER, data=salary.data,
        main = "Box Plot - Salaries grouped by Gender",
        xlab = "Gender",
        ylab = "Salaries",
        labels = TRUE,
        boxwex = 0.3,
        outline = TRUE,
        outpch = 10,
        outcol = "seagreen",
        las = 1,
        notch = FALSE,
        staplewex = 1,
        col = "Light Blue")

library(psych)

# e) summary statistics of salaries as one group and summary statistics within each gender
describe(salary.data$SALARY)

describeBy(salary.data$SALARY, salary.data$GENDER)

