# Distributions

## Normal Distribution

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/1.png?raw=true)

The Central Limit theorem states that when a phenomenon/experiment happens around infinite times, the distribution (bar plot of the frecuency of occurence values in a series of values) of the outcomes of such event reaches the shape of a **Normal Distribution**, not to be confused with Standard Normal Distribution. Normal Distribution means that the mayority of data (68%) is concentrated around the mean, leaving the rest in the sides. 

- Normal Distribution has a symmetrical shape of a Gaussian Bell.

## Skewness

Skewness is when our data, instead of being **symmetrically centered** around the mean, it has the mayority of data values concentrated in either the right side or the left side of the x axis.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/2.png?raw=true)

- If the mayority of data values is concentrated to the left side, we say we have a **Positive Skew**. 

    - The skewness is classified according to the distribution's tail: it is positive skew because the mayority of data values is concentrated on the left side, leaving the tail on the right (positive) side. The parte that has less data value concentration (tail) is the one that determines *the type of skewness*.

- If the mayority of data values is concentrated to the right side, we say we have a **Negative Skew**. 

## Central Tendency Measures Position

If we have a perfect Normal Distribution, all three central tendency measures CTM (mean, median, mode) are in the center of the distribution, which is also the point that maximizes the curve.

- If there is **Positive Skew**, since the mayority of data values is concentrated to the left side, the **mode will be the smallest of the three measures**, located at the point where the density curve is maximized. Then, the **median**, since it is the point that divides 50% of data on each side; and at last the **mean**, because the mean is the most affected CTM by atypical values, so it is the CTM that is located nearest to the tail. *The biggest the tail, the further the mean will be from the mode*.

- If there is **Negative Skew**, since the mayority of data values is concentrated to the right side, the **smallest will be the mean**, because it is *dragged* towards the tail in the left side of the axis since its sensitivity to outliers/atypicals. Then, follows the **median** and the biggest is the **mode**.

Thus, if we compare the three CTM: mean, median and mode, **we can conclude which skewness our data has**, which distribution shape. The median is more resistant to outliers than the mean, and the mean is not always in the center of the x axis.

- If the three CTM are almost equal, we say we have a **symmetrical distribution**.

- If we have mean > mode, we have a **positive skew** shape.

- If we have mean < mode, we have a **negative skew** shape.

### Examples

- Positive Skew

```R
> h = hist(mydata$age, breaks=seq(0, 100, by=5), right=F)
> age_frequency = h$counts
> mean(mydata$age)
36.75
> median(mydata$age)
31
> which.max(age_frequency) # mode
6-10
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/3.png?raw=true)

We have mode = 6-10, say 8, and a mean = 36.75, thus we have a Positive Skew: mode < median < mean.

- No Skew (Normal Distribution)

```R
> h = hist(mydata$age, breaks=seq(0, 100, by=5), right=F)
> age_frequency = h$counts
> mean(mydata$age)
48.52
> median(mydata$age)
51
> which.max(age_frequency) # mode
51-55
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/4.png?raw=true)

We have a mode around 53, a mean = 48 and median = 51. They are pretty close, so we can say **No Skew**: mode = median = mean.

- Negative Skew

```R
> h = hist(mydata$age, breaks=seq(0, 100, by=5), right=F)
> age_frequency = h$counts
> mean(mydata$age)
58.22
> median(mydata$age)
63.5
> which.max(age_frequency) # mode
81-85
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/5.png?raw=true)

We have a mode around 83, a mean = 58 and median = 63. We can say **Negative Skew**: mean < median < mode.

## Central Moment

The kth *central* moment (or moment around the *mean*) of a data population is:

![\Large \mu_k=\frac{1}{N}\sum^{N}_{i=1}{(x_i-\mu)^k}](https://latex.codecogs.com/svg.latex?\Large&space;\mu_k=\frac{1}{N}\sum^{N}_{i=1}{(x_i-\mu)^k})

Where k tells the order of the moment and x_i is each value of vector x. In particular, the second central moment of a population is its **variance**.

```R
> install.package("e1071") # in the command prompt
> library(e1071)
> moment(mydata$age, order=2, center=T) # variance
738.74
```
or 

```R
> x = mydata$age
> k = 2
> sum((x - mean(x))^k) / (length(x))
738.74
```

- When **k is even** we will have a positive central moment (sum of distances).

- When **k is odd** we can have a negative central moment value or a very small value, because the sign of the difference with the mean is maintained.

As a note, we send `centre=TRUE` because we want to substract the mean, if we don't specify this, we will just be getting *moments* not *central moments*, which are kind of averages (if we send `central=FALSE` and k = 1, then we get literally the average/mean).

- The idea of a kth moment is to retrieve information from your data with the differences with respect to the mean raised to the power of k.

- The central moment of kth order is still very sensitive to differences or outliers with the mean.

### Skewness

The **skewness** (gamma_1) of a data population is defined by the following formula, where mu_2 and mu_3 are the 2nd and 3rd central moments.

![\Large \gamma_1=\frac{\mu_3}{(\mu_{2})^{\frac{3}{2}}}](https://latex.codecogs.com/svg.latex?\Large&space;\gamma_1=\frac{\mu_3}{(\mu_{2})^{\frac{3}{2}}})

which would be

![\Large \gamma_1=\frac{\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^3}}{(\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^2)^{3/2}}](https://latex.codecogs.com/svg.latex?\Large&space;\gamma_1=\frac{\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^3}}{(\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^2)^{3/2}})

```R
skewness(mydata$age)
0.4911
```

Where 0.0 skewness would mean **symmetric distribution**, +1.0 **positive skewness (tail tells the sign)** and -1.0 **negative skewness**. Can be larger than 1, we just need the sign to get the skewness type.

*Note: the 3rd moment maintains the sign of the distance between each point and the mean.*

## Kurtosis (How are the tails?)

Kurtosis (gamma_2) is a numerical method in statistics that measures the sharpness of the peak in the data distribution.

![\Large \gamma_2=\frac{\mu_4}{(\mu_2)^2}=\frac{\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^4}}{(\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^2)^{2}}](https://latex.codecogs.com/svg.latex?\Large&space;\gamma_2=\frac{\mu_4}{(\mu_2)^2}=\frac{\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^4}}{(\frac{1}{N}\sum^{N}_{i=1}{(x_i-\bar{x})^2)^{2}})

This measure has to do with **how big are the tails of the distribution of x**, whether the tails are long and the data is very spread out, or the tails are short and the data is very close together in the x axis. It involves the 2nd central moment (mu_2) and the 4th central moment (mu_4).

## Excess Kurtosis

The excess kurtosis of a univariate population is defined by:

![\Large \gamma_2=\frac{\mu_4}{(\mu_2)^2}](https://latex.codecogs.com/svg.latex?\Large&space;\gamma_2=\frac{\mu_4}{(\mu_2)^2}-3)

*The normal distribution has krutosis = 3*.

The R language's function `kurtosis()` outputs the kurtosis - 3, or the excess of kurtosis: how different my distribution is from the normal.

- The excess of kurtosis describes the tail shape of the data distribution.

- The **normal distribution** has zero excess kurtosis, and thus the **standard tail shape**. It is called **mesokurtic**.

    - **Negative excess kurtosis** would indicate a thin-tailed (not a large tail) data distribution, it is called **platykurtic**. Thus the kurtosis must be a value smaller than 3. This means that the tail is very short horizontally speaking.

    - **Positive excess kurtosis** would indicate a fat-tailed (large tail) distribution, it is called **leptokurtic**. Thus the kurtosis must be a value larger than 3.

| Kurtosis | Excess of Kurtosis | Meaning |
| ---- | ---- | ---- |
| k=3 | gamma_2=0 | Normal Distribution |
| k<3 | gamma_2<0 | Platykurtic / thin-tailed (short tail) |
| k>3 | gamma_2>0 | Leptokurtic / fat-tailed (large tail) |

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/6.png?raw=true)

If you have large tails, that means that you have more values in the tails, and thus it is more probable that a value falls in a tail instead of the central body of the distribution.

### Examples

- Leptokurtic (large tails)

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/7.png?raw=true)

K > 3 and gamma_2 > 0 (leptokurtic/fat-tails): lots of data in tails.

```R
> kurtosis(mydata$age) + 3
4.0006
> kurtosis(mydata$age)
1.0006
```

- Mesokurtic

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/8.png?raw=true)

K == 3 and gamma_2 == 0 (mesokurtic): normal distribution.

```R
> kurtosis(mydata$age) + 3
3.0154
> kurtosis(mydata$age)
0.0154
```

- Platykurtic

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/9.png?raw=true)

K < 3 and gamma_2 < 0 (platykurtic/fat-tails): few data in tails, short tails.

```R
> kurtosis(mydata$age) + 3
2.164
> kurtosis(mydata$age)
-0.835
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/10.png?raw=true)

# Two or More Variable Measures

## Scatter plot

A scatter plot pairs up values of two quantitative variables in a data set and display them as geometric points inside a Cartesian diagram. Used for **linear correlation** visualization.

- plot(x,y): x for duration and y for wait variable.

```R
plot(data$duration, data$wait, xlab="Duration", ylab="Waiting Time")
```

## (Linear) Covariance

The covariance of two variables x and y in a data set measures how the two are **linearly related.**

![\Large corr(x,y)=\frac{Cov(x,y)}{\sqrt{var(x)\times{var(y)}}}](https://latex.codecogs.com/svg.latex?\Large&space;Cov(x,y)=\frac{\sum^{m,n}_{i,j=1}{(x_i-\bar{x})(y_j-\bar{y})}}{n})

where n is the length of x column variable (same as y length).

```R
> cov(data$duration, data$wait)
13.97781
> cov(data$wait, data$duration)
13.97781
```

It tells us how the increment of one variable **indicates change** in another variable. The covariance can define three types of relationship between two variables:

1. Relationship with positive trend.

2. Relationship with negative trend.

3. When there is no relationship because there is no trend in data.

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/11.png?raw=true)

In general:

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/slides/20.png?raw=true)

## Correlation Coefficient

The correlation coefficient is their covariance divided by the product of their individual standard deviations. It is a normalized measurement of how the two are linearly related.

![\Large corr(x,y)=\frac{Cov(x,y)}{\sqrt{var(x)\times{var(y)}}}](https://latex.codecogs.com/svg.latex?\Large&space;corr(x,y)=\frac{Cov(x,y)}{\sqrt{var(x)\times{var(y)}}})


```R
> cor(data$wait, data$duration)
0.9008112
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/12.png?raw=true)

The correlation coefficient ranges from [-1,1]. A correlation of zero means that when x increases, y can either grow or decrease, there is no pattern.

**Correlation is not causality**: For example, in summer the consumption of ice cream increases as well as the sun burns in skin. Thus, the consumption of ice cream and quantity of sun burns are correlated positively, **but eating ice cream does not increase the risk of sun burns**.

- Causality: when one cause is responsible of the occurrence of another thing (effect).

Some correlations might be causes, but one needs to analyse each case and where the data comes from and what does it mean. More analysis is needed to determine if a correlation is a cause.

Why is correlation useful? we can predict with one column another column.

## Correlation Plot

```R
install.packages("corrplot")
library(corrplot)
M = cor(mydataframe)
M = round(M, 2) # M is the correlation matrix
corrplot(M, methor="circle") # circle, square, ellipse, number, shade, color, pie
```

![img](https://github.com/the-other-mariana/stats-ds/blob/master/week9/res/13.png?raw=true)