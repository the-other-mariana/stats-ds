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