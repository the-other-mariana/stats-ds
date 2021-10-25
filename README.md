# Notes

- The variance is the average of the **squared** difference of each data from the mean.

- The variance is very sensible to differences with the mean.

- The variance is the sum of the **distance** of each data point and the mean.

## Standard Deviation

- By taking the square root, we are returning to the units in which the data is: the variance was not a measure with a relationship with the data, and now it is in the same unit.

- We are still making a sum of squares, that is, we are still penalizing bigger differences than smaller ones, which has the purpose of exaggerating some differences that are important.

- The number you get you can substract it from the mean (42) and say that the mayority of data is within the range [42 - stdev (12)] and [42 + stdev (12) ].

- The stdev is also very sensible to differences with the mean.

## Variation Coefficient

- Because the stdev cannot tell must about the dispersion of the data (both cases is 10), we use the **variance coefficient**.

- If you have 0.29 then it means that all the data is away from the mean by 30%.

- If you have 0.059 then it means that all the data is away from the mean by 5%, there is little variation between data.

- It is a ratio of how much the stdev is in percentage with respect to the mean value. For example, stdev of 5 and mean of 10 then you have a coefficient of variation pf 50%, because the stdev is the half of the mean: the data can differ from the mean by 50%.

- If the coefficient of variance is higher than 50% it says that the data is either very disperse from the mean or there are atypical values (because it is an **average**).

## Exercise

## Quantiles

- Quartiles are must less variant with atypical values, because the quartile division is made based on the amount of data.

Q = L_i + ((P * N - F_{i-1}) / f_i) * A
Q = 20 + ((0.5 * 510 - 226) / 54) * 5

