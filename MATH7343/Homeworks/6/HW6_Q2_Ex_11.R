library(haven)
work <- read_dta("C:/Users/abhil/OneDrive/Desktop/git clone/MSAM-Northeastern/MATH7343/Homeworks/6/work_program.dta")
attach(work)

# ------------- (a) --------------------
x1 = baseline[group == 1]
y1 = followup[group == 1]
wilcox.test(x1, y1, paired = T)

# ------------- (b) --------------------
x2 = baseline[group == 2]
y2 = followup[group == 2]
wilcox.test(x2,y2,paired = T)

# ------------- (c) --------------------
diff1 = x1 - y1 #Group1
diff2 = x2 - y2 #Group2
wilcox.test(diff1, diff2, paired = F)


