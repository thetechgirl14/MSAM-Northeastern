cig.data <- read.csv(file = "C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/1/number_cigs.csv", na.strings = ",", header=TRUE)
cig.data



# (a) Histogram and boxplot of average number cigerettes smoked per day

hist(cig.data$cigpday1)

boxplot(cig.data$cigpday1,
        main = "Box Plot - Cigerettes per day",
        ylab = "Number of Cigerettes smoked in a day",
        xlab = "X",
        labels = TRUE,
        boxwex = 0.3,
        outline = TRUE,
        outpch = 16,
        outcol = "seagreen3",
        las = 1,
        notch = FALSE,
        staplewex = 1,
        col = "tomato")
