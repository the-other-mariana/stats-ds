# Local Measures

Source: https://github.com/the-other-mariana/stats-ds/blob/master/week7/session-07.R

## Frequency Distribution Table

Also known as Absolute Frequency, is a table that shows for each existing value, how many times did such value appeared on a column.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/1.png?raw=true)

In other words: the frequency distribution of a data variable (column) is a summary of the data 
**occurrence** in a collection of categories.

- `table()`: Creates a table of the counts of all factors.

```R
> x <- c(8,2,7,1,2,9,8,2,10,9)
[1]  8  2  7  1  2  9  8  2 10  9
> y <- table(x)
1  2  7  8  9 10 
1  3  1  2  2  1
```

## Histogram

A histogram is a bar plot that represents the frecuency distribution of a column.

histogram consists of parallel vertical bars that graphically shows the frequency distribution of a quantitative variable. The area of each bar is proportional to the frequency of items found in each class.

### Steps:

1. Select data (`$`)

2. Find range (`range()`)

3. Defining a sequence of equal distance for the break points (intervals) (`seq()`)

4. Divide the data using the intervals (`cut()`)

5. Compute the frequency in each interval (`table()` or `hist()$counts`)

- Histogram (bar plot) of the absolute frequency

```R
# additional: absolute frequency bar plot
eruptions = mydata$eruptions
breaks4 = seq(1,6, by=0.1)
eruptions_cut = cut(eruptions, breaks4, right=F) # same params as hist()
eruptions_table = table(eruptions_cut)
barplot(eruptions_table, main='Eruptions')
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/absfreq_bar.png?raw=true)

## Relative Frequency Distribution

It is a summary of the frequency proportion in a collection of categories.

![\Large x_{scaled}=\frac{x-min(x)}{max(x)-min(x)}](https://latex.codecogs.com/svg.latex?\Large&space;relfreq=\frac{count}{total}\times100)

```R
# additional: relative frequency bar plot
eruptions = mydata$eruptions
breaks4 = seq(1,6, by=0.1)
eruptions_cut = cut(eruptions, breaks4, right=F)
eruptions_table = table(eruptions_cut)
relfreq = eruptions_table / nrow(mydata)
barplot(relfreq, main='Eruptions')
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/relfreq_bar.png?raw=true)

## Cumulative (Absolute) Frequency Distribution

Cumulative frequency distribution of a quantitative variable is a summary of data frequency below given levels

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/2.png?raw=true)

```R
# additional: cumulative absolute frequency
eruptions = mydata$eruptions
breaks3 = seq(1, 6, by = 0.1)
eruptions_cut = cut(eruptions, breaks3, right=F)
eruptions_table = table(eruptions_cut) # abs freq
cumabsfreq = cumsum(eruptions_table)
plot(cumabsfreq, main='Eruptions', xlab='Minutes', ylab='Cumulative Absolute Frecuency')
lines(cumabsfreq)
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/cumabsfreq.png?raw=true)

## Cumulative Relative Frequency Distribution

- Option 1: use `table()` to get the frequency counts

```R
eruptions = mydata$eruptions
breaks2 = seq(1,6, by =0.1)
eruptions_cut = cut(eruptions, breaks2, right=F)
eruptions_table = table(eruptions_cut)
relfreq = eruptions_table / nrow(mydata)
cumrelfreq = cumsum(relfreq)
plot(cumrelfreq, main='Eruptions', xlab='Minutes', ylab='Cumulative Relative Frecuency')
lines(cumrelfreq)
```

- Option 2: use `hist()$counts` to get the frequency counts

```R
erup = mydata$eruptions
str(erup)
min(erup) # 1.4
max(erup) # 5.6
breaks1 = seq(1, 6, by=0.1)
erupt = hist(erup, breaks=breaks1, right=FALSE)
reldata = erupt$counts / nrow(mydata)
min(reldata)
max(reldata)
cumfreq = cumsum(reldata)
plot(cumfreq, main='Eruptions', xlab='Minutes', ylab='Cumulative Relative Frecuency')
lines(cumfreq)
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/cumrelfreq.png?raw=true)

## Pie Chart

Consists of pizza wedges that shows the frequency distribution graphically.

```R
# pie chart 
pie(eruptions_table)
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/pie.png?raw=true)

## Stem and Leaf Plot

This plot helps us see not only the distribution shape of the data (overall sillouette), but also how each 'bar' is distributed inside.

```R
# stem and leaf 
stem(eruptions)
```

- point in left side of |: 1.6 what can I sum to this? .07 = 16|7 = 1.67

```
The decimal point is 1 digit(s) to the left of the |

  16 | 070355555588
  18 | 000022233333335577777777888822335777888
  20 | 00002223378800035778
  22 | 0002335578023578
  24 | 00228
  26 | 23
  28 | 080
  30 | 7
  32 | 2337
  34 | 250077
  36 | 0000823577
  38 | 2333335582225577
  40 | 0000003357788888002233555577778
  42 | 03335555778800233333555577778
  44 | 02222335557780000000023333357778888
  46 | 0000233357700000023578
  48 | 00000022335800333
  50 | 0370
```

Note: (key) 30 | 7 = 3.07

- point in right side of |: 200. + leafs in the -0 order: 2|1 = 210 = 200 + 10

```
The decimal point is 2 digit(s) to the right of the |

0 | 4
2 | 011223334555566667778888899900001111223333344455555666688888999
4 | 111222333445566779001233344567
6 | 000112233578012234468
```

## Other Findings

`which.max(vector)` returns the first maximum in the data.

```R
> mode_erup = which.max(eruptions_table)
[1.8,1.9) 
        9 
> eruptions_table
eruptions_cut
  [1,1.1) [1.1,1.2) [1.2,1.3) [1.3,1.4) [1.4,1.5) [1.5,1.6) [1.6,1.7) [1.7,1.8) [1.8,1.9)   [1.9,2)   [2,2.1) [2.1,2.2) 
        0         0         0         0         0         0         3         9        28        11        12         8 
[2.2,2.3) [2.3,2.4) [2.4,2.5) [2.5,2.6) [2.6,2.7) [2.7,2.8) [2.8,2.9)   [2.9,3)   [3,3.1) [3.1,3.2) [3.2,3.3) [3.3,3.4) 
       10         8         3         0         2         0         3         0         1         0         0         4 
[3.4,3.5) [3.5,3.6) [3.6,3.7) [3.7,3.8) [3.8,3.9)   [3.9,4)   [4,4.1) [4.1,4.2) [4.2,4.3) [4.3,4.4) [4.4,4.5) [4.5,4.6) 
        2         4         5         5         9         7        16        15        14        15        13        22 
[4.6,4.7) [4.7,4.8) [4.8,4.9)   [4.9,5)   [5,5.1) [5.1,5.2) [5.2,5.3) [5.3,5.4) [5.4,5.5) [5.5,5.6) [5.6,5.7) [5.7,5.8) 
       11        17         6         5         4         0         0         0         0         0         0         0 
[5.8,5.9)   [5.9,6) 
        0         0 
```

To calculate the mode:

- `which(myvec==value)`: The which function in R returns the position of the values in the logical vector.

```R
> x <- c(8,2,7,1,2,9,8,2,10,9)
[1]  8  2  7  1  2  9  8  2 10  9
> y <- table(x)
1  2  7  8  9 10 
1  3  1  2  2  1
> names(table(x))[which(table(x)==max(table(x)))]
[1] "2"
```

```R
> mode_erup = names(eruptions_table)[which(eruptions_table==max(eruptions_table))]
> mode_erup
"[1.8,1.9)"
```





