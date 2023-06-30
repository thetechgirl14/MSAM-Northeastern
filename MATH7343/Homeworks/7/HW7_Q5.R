library("MKinfer")

s1=rbinom(100000,60,0.12)
x1=round(mean(s1),0)
x1
ci1=binomCI(x=x1, n=60, conf.level = 0.90, method = "wald")
ci1
ci2=binomCI(x=x1, n=60, conf.level = 0.90, method = "wilson")
ci2

