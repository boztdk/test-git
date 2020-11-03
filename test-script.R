a <- 2
b <- 2
c <- 2


(mat <- matrix(sample(c(TRUE, FALSE), 12, replace = TRUE), 3))

# 1)
(ifelse(mat == TRUE,1,0))

# 2) but not so good since we lose the structure
as.numeric(mat)

# 3)
mat + 0


###########################################

# 3.3.3 Exercises

# 1)

advr38pkg::sum_every(1:10, 2)


sum_every <- function(x, n) {
  l <- length(x)
  dim(x) <- c(n, 1/n)
  colSums(x)
}

sum_every(1:10, 2)


# 2)

str(iris)

index <- sapply(iris, is.numeric)
iris[index]

sapply(iris[index], mean)

#or do

colMeans(iris[index])


# 3)

mat <- matrix(0, 10, 2); mat[c(5, 8, 9, 12, 15, 16, 17, 19)] <- 1; mat
(decode <- matrix(c(0,NA, 1,2), 2))

x <- mat[1,]
apply(mat, 1, function(x) decode[x[1] + x[2] + 1])

decode[mat + 1]
