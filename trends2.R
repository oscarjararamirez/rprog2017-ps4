load.libraries <- c('tidyverse','ggplot2','gtrendsR','Quandl')
install.lib <- load.libraries[!load.libraries %in% installed.packages()]
for(libs in install.lib) install.packages(libs, dependencies = TRUE)
sapply(load.libraries, require, character = TRUE)





trump.trend <- gtrends(c("Trump"), gprop = "web", time = "all")[[1]]
class(trump.trend)
head(trump.trend)

class(trump.trend$date)

ggplot(data = trump.trend) + geom_line(mapping = aes(x= date, y = hits))
?gtrends

trump.trend <- trump.trend %>% filter(date >= as.Date("2012-01-01")) #trump election winning
ggplot(data = trump.trend) + 
  geom_line(mapping = aes(x= date, y = hits)) +
  geom_vline(xintercept = as.Date("2016-11-06"), color = "red") 
