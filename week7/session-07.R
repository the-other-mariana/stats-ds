# histogram of relative cumulative function

mydata = faithful

# exercise: plot the cumulative relative frequency of eruptions column
# option 1: using hist to get counts (absolute frequency)
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
#plot(cumfreq, main='Eruptions', xlab='Minutes', ylab='Cumulative Relative Frecuency')
#lines(cumfreq)

# option 2: using cut and table to get counts (absolute frequency)
eruptions = mydata$eruptions
breaks2 = seq(1,6, by =0.1)
eruptions_cut = cut(eruptions, breaks2, right=F)
eruptions_table = table(eruptions_cut)
relfreq = eruptions_table / nrow(mydata)
cumrelfreq = cumsum(relfreq)
plot(cumrelfreq, main='Eruptions', xlab='Minutes', ylab='Cumulative Relative Frecuency')
lines(cumrelfreq)
# mode of eruptions
mode_erup = names(eruptions_table)[which(eruptions_table==max(eruptions_table))]
mode_erup # "[1.8,1.9)"
eruptions_table
which.max(seq(10,0,by=-1)) # outputs the index where the max is

# additional: cumulative absolute frequency
eruptions = mydata$eruptions
breaks3 = seq(1, 6, by = 0.1)
eruptions_cut = cut(eruptions, breaks3, right=F)
eruptions_table = table(eruptions_cut) # abs freq
cumabsfreq = cumsum(eruptions_table)
#plot(cumabsfreq, main='Eruptions', xlab='Minutes', ylab='Cumulative Absolute Frecuency')
#lines(cumabsfreq)

# additional: absolute frequency bar plot
eruptions = mydata$eruptions
breaks4 = seq(1,6, by=0.1)
eruptions_cut = cut(eruptions, breaks4, right=F)
eruptions_table = table(eruptions_cut)
#barplot(eruptions_table, main='Eruptions')

# additional: relative frequency bar plot
eruptions = mydata$eruptions
breaks4 = seq(1,6, by=0.1)
eruptions_cut = cut(eruptions, breaks4, right=F)
eruptions_table = table(eruptions_cut)
relfreq = eruptions_table / nrow(mydata)
#barplot(relfreq, main='Eruptions')

# pie chart 
#pie(eruptions_table)

# stem and leaf 
stem(eruptions)
sort(eruptions)