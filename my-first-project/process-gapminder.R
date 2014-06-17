# I expect to be executed from the my-first-project directory!

require(ggplot2)

source('detrending.R')

gDat <- read.delim('../data/gapminderDataFiveYear.txt')

detrended.df <- detrend.countries(gDat)

base.scatter <- ggplot(detrended.df, aes(x=gdpPercap, y=lifeExp)) + geom_point()

log.log_trans <- coord_trans(xtrans='log10', ytrans='log10')

base.scatter + coord_trans(xtrans='log10', ytrans='log10')

base.scatter + log.log_trans

country.mean.df <- ddply(detrended.df, 'country', 
                         summarize, mean.gdp=mean(gdpPercap), 
                         mean.life=mean(lifeExp))

mean.scatter <- ggplot(country.mean.df, 
                       aes(x=mean.gdp, y=mean.life)) + geom_point()

mean.scatter + log.log_trans

png('first-plot.png')
mean.scatter + log.log_trans
dev.off

# Making 142 plots

# df should have continent, country, etc...
plot.country <- function(df) {
  png(paste0(df$continent[1], '-', df$country[1], '.png'))
  print(ggplot(df, aes(x=gdpPercap, y=lifeExp, size=pop)) +    
            geom_point())
  dev.off()
  
  return()
}


d_ply(gDat, .(country), plot.country)
