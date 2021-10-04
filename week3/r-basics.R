# create 4 arrays of the basic types
arr_char = character(5)
arr_num = numeric(5)
arr_log = logical(5)
arr_int = integer(5)

# fill arrays
arr_char = c("1", "2", "3", "4", "5") 
arr_int = c(1L, 2L, 3L, 4L, 5L)
arr_log = c(TRUE, FALSE, FALSE, TRUE, FALSE)
arr_num = c(1, 2, 3, 4, 5)

# combine func to add vectors in different positions
arr_char = c("-1", "0", arr_char)
arr_char = c(arr_char, "6", "7")

# create a big array with a sub array
base = c(1L,1L,0L,0L)

r = c(base, base, base, base)
print(r)

# sequence of 200 numbers that are multiples of 3
m3 = seq(length=200, from=0, by=3)
print(m3)

# use the basic stats functions
print(mean(m3))
print(median(m3))
print(sd(m3))
print(sum(m3))
print(prod(m3))
print(min(m3))
print(max(m3))

# create an array using the concept of recycling
start = seq(from=-5, to=5, by=0.2)
end = c(1,0,0)
print(start*end)

# create a vector of length 300 with multiples of 7
m7 = seq(length=300, from=0, by=7)
print(m7)
# print the element on pos 20
print(m7[20])
# print the elements on pos 50,100,150...
print(m7[-c(50,100,150,200,250,300)])
# print all elements except in pos 2
print(m7[-2])
# print elements between positions 100 and 150
print(m7[100:150])
# all except elements between pos 150 and 200
print(m7[-c(150,200)])
print(m7[m7<200])
print(m7[m7>100])
# redimension the vector as 30x10 matrix
dim(m7) = c(30,10)
print(m7)

data = seq(length=50, from=0, by=3)
mtx3 = matrix(data, nrow=10, ncol=5)
print(mtx3)
mtx3 = matrix(data, nrow=10, ncol=5, byrow=TRUE)
print(mtx3)

data = c(25,56,78,98,12,45,26,54,10,16,14,9)
mtx = matrix(data, nrow=4,ncol=3)
dimnames(mtx) = list(c("1995", "1996","1997","1998"), c("camisas", "pantalones","chamarras"))
print(mtx)
csum = colSums(mtx)
cmean = colMeans(mtx)
mtx = rbind(mtx, csum, cmean)
print(mtx)

rsum = rowSums(mtx)
rmean = rowMeans(mtx)
mtx = cbind(mtx, rsum, rmean)
mtx[5, 4] = 0
mtx[5, 5] = 0
mtx[6, 4] = 0
mtx[6, 5] = 0
print(mtx)

data1 = c("bad", "good", "indifferent", "good", "good", "bad", "bad", "indifferent", "bad", "good")
data1 = factor(data1, levels=c("bad", "indifferent", "good"), ordered=TRUE)
str(data1)

data2 = c("cat", "dog", "fish", "fish", "dog", "dog", "dog", "cat", "dog", "dog")
data2 = factor(data2, levels=c("dog", "cat", "fish"))
str(data2)

strange_list = list(first=2:20, second="Mariana", third=matrix(1:4, nrow=2,ncol=2), fourth=c("1", "2", "3"), fifth=1L)
strange_list

c1 = c("bad", "good", "indifferent", "yes", "good", "bad", "bad", "yes", "bad", "good")
c1 = factor(c1, levels=c("bad", "indifferent", "good", "yes"))
c2 = vector(length=10)
c3 = 1:10
c4 = seq(length=10, from=0, by=3)
c5 = seq(length=10, from=0, by=2)

df = data.frame(factores=c1,logicos=c2,numerico=c3,col4=c4,col5=c5)
df
str(df)
head(df)
tail(df)

df2 = data.frame(df[[1]], df[[2]])
df2

df3 = data.frame(df[[4]], df[[5]])
df3