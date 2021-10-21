# Local Measures

Source: https://github.com/the-other-mariana/stats-ds/blob/master/week7/session-07.R

## Frequency Distribution Table

Also known as Absolute Frequency, is a table that shows for each existing value, how many times did such value appeared on a column.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week7/res/1.png?raw=true)

In other words: the frequency distribution of a data variable (column) is a summary of the data 
**occurrence** in a collection of categories.

- `table()`: Creates a table of the counts of all factors.

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