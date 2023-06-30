# Load the data
data <- read.table("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/Finals/PermutationTestData.txt", header = TRUE)
data

# --------------------(a)----------------------
# Conduct a two-sample t-test
t.test(X ~ Group, data = data, mu = 0, var.equal = TRUE)

# --------------------(b)----------------------
# Define a function to calculate the two-sample t-test statistic
t_statistic <- function(x, group) {
  mean_diff <- abs(diff(tapply(x, group, mean)))
  se <- sqrt(sum(tapply(x, group, var) / table(group)))
  t_val <- mean_diff / se
  return(t_val)
}

# Calculate the observed t-test statistic
obs_t <- t.test(X ~ Group, data = data, mu = 0, var.equal = TRUE)$statistic

# Set the number of permutations
n_perm <- 10000

# Create a vector to store permuted t-test statistics
perm_t <- rep(NA, n_perm)

# Permute the group labels and calculate t-test statistics for each permutation
for (i in 1:n_perm) {
  perm_group <- sample(data$Group)
  perm_t[i] <- t_statistic(data$X, perm_group)
}

# Calculate the p-value as the proportion of permuted t-test statistics that are as extreme
# as the observed t-test statistic in the direction of the alternative hypothesis
p_val <- mean(abs(perm_t) >= abs(obs_t))

# Print the results
cat("Observed t-test statistic:", obs_t, "\n")
cat("Permutation test p-value:", p_val, "\n")

