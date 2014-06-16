How to use my code
========================================================
author: Me!
date: Today

First Slide
========================================================

Just do this:


```r
source('detrending.R')
gDat <- read.delim('../data/gapminderDataFiveYear.txt')
detrended.df <- detrend.countries(gDat)
```

Slide With Plot
========================================================


```r
china.deviation <- subset(detrended.df, country == 'China', c(deviation, year))
plot(deviation ~ year,
     china.deviation)
```

![plot of chunk unnamed-chunk-2](Sample-lab-meeting-figure/unnamed-chunk-2.png) 
