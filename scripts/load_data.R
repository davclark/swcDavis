#helper script to load my data
#call this file with
# source(file.path("scripts", "load_data"))
#in order to load the gapminder dataset

gDat <- read.delim(file.path("data",
                             "2014-06-16", "gapminder", "gapminderDataFiveYear.txt"))