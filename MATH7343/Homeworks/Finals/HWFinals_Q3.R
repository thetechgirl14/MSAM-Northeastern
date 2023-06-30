# create contingency table
Above_Normal <- c(16, 8)
Below_Normal <- c(5, 1)
march_table <- rbind(Above_Normal, Below_Normal)
rownames(march_table) <- c("Above Normal", "Below Normal")
colnames(march_table) <- c("Yes", "No")
march_table

# perform chi-squared test
prop.test(march_table, correct = FALSE)

