# R in Action E-Book
# creating Vectors
a <- c(1, 2, 5, 3, 6, -2, 4)
b <- c("one", "two", "three")
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

# selecting elements of a vector
a <- c("k", "j", "h", "a", "c", "m")
a[3]
a[c(1, 3, 5)]
a[2:6]

# creating matrices
y <- matrix(1:20, nrow=5, ncol=4)

cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))

# Building Quantiles
# method #1
quantile(df3$Weighted.Avg.Tuition.Rate, probs = seq(0.1, 0.9, by = 0.1))
# method #2
df2$quantile <- ntile(df2$Weighted.Avg.Tuition.Rate, 5)
y <- df2 %>% group_by(quantile) %>% summarise(max = max(Weighted.Avg.Tuition.Rate))
# method #3

# Delete column by name
df = subset(mydata, select = -c(x,z))

drop <- c("x","z")
df = mydata[,!(names(mydata) %in% drop)]
