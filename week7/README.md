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

- Histogram (bar plot) of the relative frequency

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

## Relative Frequency Distribution

It is a summary of the frequency proportion in a collection of categories.

![\Large x_{scaled}=\frac{x-min(x)}{max(x)-min(x)}](https://latex.codecogs.com/svg.latex?\Large&space;relfreq=\frac{count}{total}\times100)

```R
eruptions = mydata$eruptions
breaks4 = seq(1,6, by=0.1)
eruptions_cut = cut(eruptions, breaks4, right=F)
eruptions_table = table(eruptions_cut)
relfreq = eruptions_table / nrow(mydata)
barplot(relfreq, main='Eruptions')
```

![img]()

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