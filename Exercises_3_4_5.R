
library(advr38pkg)

# Exercises 3.4.5

# 1)

advr38pkg::split_ind(1:40, 3)


# my answer

split_ind <- function(vec,K) {
  s1 <- sample(vec, length(vec), replace=FALSE)
  s2 <- split(s1,K)
  s2
}

split_ind(1:40, 3)


# the answer

x <- 1:40
K <- 3
f <- sample(rep_len(1:K, length(x)))
split(x,f)

split_ind <- function(x, K) {
  f <- sample(rep_len(1:K, length(x)))
  split(x,f)
}

split_ind(1:40, 3)


# 2)

# my answer

set.seed(1)
(x <- rnorm(10))

mean <- mean(x)
std.err <- sd(x)/sqrt(length(x))

conf.int.low <- mean - 1.96*std.err
conf.int.high <- mean + 1.96*std.err

# the answer

set.seed(1)
(x <- rnorm(10))

y <- replicate(1e6, mean(sample(x, replace = TRUE)))
hist(y)
abline(v = mean(x), col="red")
quantile(y, probs = c(0.025, 0.975))


# 3)

# my answer

my_mtcars <- mtcars[c("mpg", "hp")]

my_mtcars$my_col <- sample(c("mpg", "hp"), size = nrow(my_mtcars), replace = TRUE)
head(my_mtcars)


library(dplyr)

my_mtcars <- my_mtcars %>%
  mutate(my_val = case_when(my_col == "mpg" ~ mpg,
                            my_col == "hp" ~hp))

head(my_mtcars)


# the answer


my_mtcars <- mtcars[c("mpg", "hp")]

my_mtcars$my_col <- sample(c("mpg", "hp"), size = nrow(my_mtcars), replace = TRUE)
head(my_mtcars)

ind_col <- match(my_mtcars$my_col, names(my_mtcars))
ind_row <- seq_len(nrow(my_mtcars))
my_mtcars$my_val<- my_mtcars[1:2][cbind(ind_row,ind_col)]


# 4)

# my answer

df <- data.frame(
  id1 = c("a", "f", "a"),
  id2 = c("b", "e", "e"), 
  id3 = c("c", "d", "f"),
  inter = c(7.343, 2.454, 3.234),
  stringsAsFactors = FALSE
)
df

(code <- setNames(1:6, letters[1:6]))


# the answer

df$id1 <- code[df$id1]
df[1:3] <- lapply(df[1:3], function(x) code[x])
df






