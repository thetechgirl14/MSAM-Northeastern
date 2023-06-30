data <- read.table("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/Finals/Nematodes.txt", header = TRUE)
data

group1 <- c(10.8, 9.1, 13.5, 9.2)
group2 <- c(11.1, 11.1, 8.2, 11.3)
group3 <- c(5.4, 4.6, 7.4, 5.0)
group4 <- c(5.8, 5.3, 3.2, 7.5)

nematodes <- data.frame(value = c(group1, group2, group3, group4),
				group = factor(rep(c("Group 1", "Group 2", "Group 3", "Group 4"), each = 4)))

# --------------------(a)----------------------
# Conduct the ANOVA
fit <- aov(value ~ group, data = nematodes)
summary(fit)

# --------------------(b)----------------------
# Define the contrast weights
weights <- c(-1, 1/3, 1/3, 1/3)
with_nematodes <- c(weights[2]*group2, weights[3]*group3, weights[4]*group4)
without_nematodes <- weights[1]*group1
without_nematodes
t.test(without_nematodes, with_nematodes)

# --------------------(c)----------------------
# Define the contrast weights
weights2 <- c(0, -1, 1, 0)

nematodes_1000 <- weights2[2]*group2
nematodes_5000 <- weights2[3]*group3

t.test(nematodes_1000, nematodes_5000)
