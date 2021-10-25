# Dispersion Measures

## Variance

The variance is a numerical measure of how the data values are dispersed around the **mean**. The sample (which in this course will be **population**) variance is:

![\Large \sigma^2=\frac{\sum^{N}_{i=1}{(x_{i}-\mu)^2}}{N}](https://latex.codecogs.com/svg.latex?\Large&space;\sigma^2=\frac{\sum^{N}_{i=1}{(x_{i}-\mu)^2}}{N})

Where N is the number of data values.

```R
x = mydata$age 
var(x) # option 1
sum((x-mean(x))^2) / length(x) # option 2
```

- The variance is the average of the **squared differences sum** of each data from the mean.

- The variance is very sensible to differences with the mean, because the difference with the mean is raised to the power of two, which increases a lot when the number is large. Large diffrences contribute more to a change in variance than small differences.

- The variance is the average of the squared separation between each data point and the mean.

- The variance is the sum of the **distance** of each data point and the mean.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/1.png?raw=true)

In the image we can see that income column will have a larger variance because there is data that is accross a very wide-valued x axis (mean = 78 and the last data is 1120). In the age column, the variance will be smaller since the data in x axis looks not so spread out and the values in the axis itself are smaller.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/2.png?raw=true)

With this stem plot we can see that from 600 there are only 4 data values bigger than 600, so if we take those 4 out, the variance decreased from 12 612 to 5 591.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/3.png?raw=true)

If the variance is very high, we can have two possibilities: all data is very spread out (not a lot of repeated values), or there are a few atypically distant values that are increasing the variance. Either way, it tells you something about the distribution of the data.

*Note: The **mean** tells us that if we want all data points to contribute to the sum of them **equally**, they would need to have the value of the mean.*

## Standard Deviation

The standard deviation is the square root of the variance.

![\Large \sigma=\sqrt{\frac{\sum^{N}_{i=1}{(x_{i}-\mu)^2}}{N}}](https://latex.codecogs.com/svg.latex?\Large&space;\sigma=\sqrt{\frac{\sum^{N}_{i=1}{(x_{i}-\mu)^2}}{N}})

```R
x = mydata$age 
sqrt(var(x)) # option 1
sd(x) # option 2
```

The standard deviation is a value in the same units as the original values, which makes it easier to interpret.

By taking the square root, we are returning to the units in which the data is: the variance was not a measure with a direct relationship with the data, and now the stdev is in the same units. We are still summing up the squared differences, we are just returning the value to same unit scope.

- We are still making a sum of squares, that is, **we are still penalizing bigger differences than smaller ones**, which has the purpose of exaggerating some differences that are important. In teh variance and stdev we raise to the squared power in order to eliminate negatives (we do not care if the number is bigger or smaller than the mean, only its distance) and also penalize bigger differences more.

    > Example: we have two data points: -5 and 5. The mean = 0. Their variance would be (25 + 25)/2 = 25, and their stdev is 5. If we just sum the absolute values we would be getting a variance of 5 + 5 = 10. Or if we just sum the differences, we would get a stdev of sqrt(-5 + 5) = 0.

The number you get as stdev you can substract it from the mean (42) and say that **the mayority** of data is within the range [42 - stdev (12)] and [42 + stdev (12)], marked as the square in the image. We say **the mayority** instead of a percentage because the exact percentage depends on the distribution that the data has. For example, if it was a normal distribution we would say that the 68% of the data values are in the range of [42 - stdev (12)] and [42 + stdev (12)].

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/4.png?raw=true)

The variance gives us an idea of dispersion but does not have a direct relationship with the data, while the sdtev is in the same units as the data values and therefore has a direct relationship with the data and gives us a more specific idea of dispersion.

The stdev is also very sensible to differences with the mean, if we perform the same task of deleting the 4 atypical values, the stdev decreases a lot as well.

## Variation Coefficient

![\Large CV=\frac{\sigma}{\mu}](https://latex.codecogs.com/svg.latex?\Large&space;CV=\frac{\sigma}{\mu})

Take this two data set examples:

![CV=\frac{\sigma}{\mu}](https://latex.codecogs.com/svg.latex?&space;CV_1=\frac{\sigma_1}{\mu_1}=\frac{10}{168}=0.059)

![CV=\frac{\sigma}{\mu}](https://latex.codecogs.com/svg.latex?&space;CV_2=\frac{\sigma_2}{\mu_2}=\frac{10}{17}=0.58)

We use this ratio called Variation Coefficient because the stdev cannot tell must about the real dispersion of the data (in both cases, the stdev is 10), and with this ratio we can tell how much of a mean is the standard deviation.

It is a ratio of how much the stdev is in percentage with respect to the mean value. For example, stdev of 5 and mean of 10 then you have a coefficient of variation of 50%, because the stdev is the half of the mean: the data can differ from the mean by an average 50% of the mean itself. A 50%+ percent is a big dispersion/variation, a 5% is a small dispersion. It can be more than 100%, meaning that stdev is bigger than the mean and that is a huge dispersion. Thus, the amount of dispersion has a lot to do with the mean also: we cannot say that a stdev value, say 10, means a high or low dispersion always, we need to also relate it to the mean.

- It is also very sensible to atypicals from the mean (because it involves the stdev).

- If the coefficient of variance is higher than 50% it says that the data is either very disperse from the mean or there are atypical values (because it is an **average**).

- For ML or classification problems, it is advised to have a dataset with a large dispersion/variation, so that the algorithm is trained for various types of data.

## Exercise

## Quantiles

A quantile is a cut point, or line of division, that splits a probability distribution into continuous intervals with equal probabilities.

Quantiles can either be quartiles, when we divide the data set in 4 parts; quintiles, when we divide the data set into 5 parts; and percentiles, when we divide the data set into a 100 parts. But they are all **quantiles**: a division of the data set in equally-sized parts.

## Quartiles

1. Sort the data values in ascending order.

2. The **first quartile Q1**, or lower quartile, is the value that cuts off the first **25%** of the ordered data.

3. The **second quartile Q2**, or median, is the value that cuts off the first **50%** of the data.

4. The **third quartile Q3**, or upper quartile, is the value that cuts off the first **75%** of the data.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/5.png?raw=true)

This is a way of actually visualizing the dispersion of the data.

The Interquartile Range (IQR) groups the 50% that surrounds the median.

```R
x = mydata$age
quantile(x) # by default divides into 4 parts
```

```
> 0%      25%     50%     75%     100%
> 18      32      41      51      73
```

- 18 is the 'Minimum' and 73 is the 'Maximum'.

The **interquartile range** of an observation variable is the difference between its upper and lower quartiles. It is a measure of how far aparte the middle portion of data (50% of all data surroundoing the median) spreads in value. 

![IQR=Q_3-Q_1](https://latex.codecogs.com/svg.latex?\Large&space;IQR=Q_3-Q_1)

```R
x = mydata$age
IQR(x)
```

### Example

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/6.png?raw=true)

*Note: if the middle point of any quartile falls into two data values, take the average of those two.*

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/7.png?raw=true)

With the mean and the standard deviation we got an **approximation** of where the mayority of data was, but with quartiles we get the **exact** point where the 50% around the median (mayority of data) begins and ends: in the code example, we can say that between 32 (Q1) and 51 (Q3) values there is the 50% of all the data values.

- Quartiles are must less variant with atypical values, because the quartile division is made based on the amount of data and not based on the data value. For example, if we go back to the **income** column example and take the quantile of that,

```
> 0%      25%     50%     75%     100%
> 9       28      45      86      1116
```

- Even though the variance is huge (12 612), the Q1 and Q3 are somehow still centered and not spread out due to atypical values. If we do the same thing of taking out the four values larger than 600, the variance goes to 5 000 but the Q1 and Q3 do not change as much as the variance.

```
> 0%      25%     50%     75%     100%
> 9       28      43      81.5    393
```

### Calculate the Quantiles in Grouped Data

The above formulas worked if we knew each and all the data values, but if we got only the table of frecuencies of the data, we can use:

![Q=L_i+\frac{P\times{N}-F_{i-1}}{f_i}\times{A}](https://latex.codecogs.com/svg.latex?\Large&space;Q=L_i+\frac{P\times{N}-F_{i-1}}{f_i}\times{A})

where:

- f = frequency

- fr = relative frequency

- F = accumulate frequency

- Fr = accumulate relative frequency

- [L_i, L_s) = interval

- A = interval size: L_s - L_i

- N = number of data values

- P = percentage we are calculating for quantile Q

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week8/res/8.png?raw=true)

If we calculate the median or Q2:

![Q=L_i+\frac{P\times{N}-F_{i-1}}{f_i}\times{A}](https://latex.codecogs.com/svg.latex?&space;Q_2=L_i+\frac{P\times{N}-F_{i-1}}{f_i}\times{A}=20+\frac{0.5\times{510}-226}{54}\times{5}=22.68)

