CollectedTime <- scan(file = "C:/Users/abhil/OneDrive/Desktop
				/MSAM-Northeastern/MATH7343/Homeworks/1/CollectedResponseTimes.txt")
time.data <- data.frame(CollectedTime)
time.data$obs.order <- seq(length(time.data$CollectedTime))
time.data$obs.phrase <- ifelse(time.data$obs.order <= 10, 1, ifelse(time.data$obs.order <= 20, 2, 3))

#scatter plot of ResponseTime vs Observation Order

plot(CollectedTime ~ obs.order, data = time.data)

#Stratified scatter plot of 3 stages

plot(CollectedTime ~ obs.phrase, data = time.data) 

#Summary

summary(CollectedTime)
summary(CollectedTime[1:10])
summary(CollectedTime[11:20])
summary(CollectedTime[21:30])