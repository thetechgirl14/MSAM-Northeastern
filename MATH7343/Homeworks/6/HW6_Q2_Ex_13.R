library(haven)
nursing <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/6/nursing_home.dta")
nursing

boxplot(nursing$occupancy~nursing$region, main = "Occupancies in Nursing Home in Different Region", xlab = "Region", ylab = "Percentage of beds Occupied")

kruskal.test(occupancy ~ region, data = nursing)