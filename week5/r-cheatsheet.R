# assign operation
var1 = 8
var1 <- 8
8 -> var1

# sequence of nums
seq1 = 1:10 # vector

# vector: sequence of elements of same type
vec1 = 1:10
vec1 = vector("logical", length=5)
vec1 = logical(5)
# specify any type: numeric, character, integer, logical, complex
# vector operations element by element
v1 = c(1,2,3)
v2 = c(4,5,6)
v3 = v1 + v2 
v3 = v1 - v2
v3 = v1 * v2
v3 = v1 / v2
# add names to vector cells
v4 = c(8, 7, 10, 9)
names(v4) = c("luka", "josip", "lovro", "iva")
names(v4) = NULL
# display vector elements
v4[-2] # all except index 2
v4[c(1,3)] # index 1 and index 3
names(v4) = c("luka", "josip", "lovro", "iva")
v4["josip"]
v5 = seq(-5,5, by = 0.2)
v5[1:10] # index 1 to 10 inclusive
v5[-(1:10)] # all except elements 1:10
v5[v5 > 0] # all elements that are positive in value
# change dimension
v6 = seq(from = 10, by = 10, length.out=15)
dim(v6) = c(3,5) # rows, cols: col1 -> 10 20 30 col2 -> 40 50 60
# class() typeof() length() str()
# as
x = c(1,2,3)
v7 = as(x, "integer")
v7 = as.integer(x)

# c combine
names = c("luka", "josip", "lovro") # vector
names = c(names, "filip")
names = c("iva", names)
assign("c2", c(1,2,3))
# cohesion
c3 = c("luka", "josip", "lovro", 5) # if one is char, the whole vec is char: "5"
c4 = c(TRUE, T, FALSE, F)
c4 = c(TRUE, T, FALSE, F, 1, TRUE) # if one is num, the whole vec is num: 1 1 0 0 1 1

# typeof()
typeof(names)

# sequences
seq1 = seq(10)
seq2 = seq(from=1, to=10, by=0.1)
length(seq2)
seq3 = seq(1,30) # default by = 1
seq4 = seq(-5,5, by = 0.2)
seq5 = seq(length = 51, from = -5, by = 0.2)

# matrices
m = matrix(nrow=2, ncol=2) # full of NA
data = c(1,2,3,4)
m = matrix(data, nrow=2, ncol=2) # fills by column: col1: 1 2 col2: 3 4
m = matrix(1:4, nrow=2, ncol=2) # fills by column
m = 1:4
dim(m) = c(2,2)
m2 = matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE) # fills by row: row1: 1 2 row2: 3 4
# names to rows and cols
m3 = matrix(1:10, nrow = 5, ncol = 2)
rownames(m3) = c("r1", "r2", "r3", "r4", "r5")
colnames(m3) = c("col1", "col2")
m4 = matrix(1:4, nrow=2, ncol=2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
# cbind() 
col1 = 1:3
col2 = 10:12
cbind(col1, col2)
# rbind()
row1 = 1:4
row2 = 10:13
rbind(row1, row2)
# recycling: if data to small, data repeats again, gives a warning
m5 = matrix(1:10, nrow=4, ncol=4)
# access
m6 = matrix(1:4, nrow=2, ncol=2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
m6[1,2] # 3
m6[1,] # 1 3 (row as vector)
m6[,2] # 3 4 (col as vector)
m6["r1", "c1"] # 1
# matrix operations element by element
m7 = matrix(1:4, nrow=2, ncol=2)
m8 = matrix(5:8, nrow=2, ncol=2)
m7*3
m7 + m8
m7 * m8
# colSums() rowSums() colMeans() rowMeans()

# lost data: NA (not available) NaN (not a number) Inf (+/-)

# factors
# used of categorial data types
# they are stored as integers
# levels are in alph order
# can be ordered or not-ordered
gender = factor(c("male", "male", "female", "male", "female"))
levels(gender) # "female" "male"
nlevels(gender) # 2
food = c("low", "medium", "low")
f2 = factor(food, levels=c("low", "medium", "high"), ordered=TRUE) # class: ordered factor typeof: integer
min(f2) # low

# lists
# can store elements of different type
# aka generic vectors
# can contain other lists
# their elements can have a name
l1 = list(1, "a", TRUE, 1+4i) # length 4
str(l1) # tells you each element type
names(l1) = c("a num", "a char", "a logic", "a cmplx")
l1[1] # 1 (list of 1 element with 1)
l1["a char"] # a (list of 1 element with a)
l1[[1]] # 1 (numeric type) access the memory cell
l2 = list(1:10, "a", TRUE, 1+4i)
l2[[1]] # vector 1:10
l3 = vector("list", length = 5) # five NULL
l4 = 1:10
l4 = as.list(l4)
# names
l5 = list(a = "lovro", b = 1:10, c = matrix(1:4, nrow=2, ncol=2)) # names: a b c
l5[[3]] # same as l5$c
l6 = list("lovro", 1:10, matrix(1:4, nrow=2, ncol=2))
names(l6) = c("a", "b", "c")

# data frame: list of lists
# rows: records cols: fields
# is a rectangular list: all its elements have the same length
# created from read.csv() read.table()
# create a new one with data.frame()
title = c("fruits", "vegetables", "meats", "cheeses")
week1 = c(12, 34, 23, 11)
week2 = c(23, 22, 45, 14)
week3 = c(40, 14, 22, 22)
done = c(T, F, F, T)
df1 = data.frame(title, week1, week2, week3, done) # cols: title week1 week2 week3 done
is.list(df1) # T
# access an element
df1[2,3] # 45
# access a column 
df1[[2]] # 12 23 40
df1[["week1"]] # 12 23 40 # same as df1$week1
# access a row
df1[4,] # cheeses 11 14 22 T
# head() tail() dim() nrow() ncol() str() names()/colnames()
