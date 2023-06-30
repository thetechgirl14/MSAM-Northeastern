garage <- read.table("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/Finals/garage.txt", header = TRUE)

# perform t-test
t.test(garage$GarageElegance, garage$JoeGarage, alternative = "greater", paired = TRUE)
