#load libraries

library(readxl)
library(dplyr)
library(ggplot2)
library(scales)
library(gganimate)
library(gdata)

# load data
mpd2018 <- read_excel("mpd2018.xlsx", sheet = "Full data")
View(mpd2018) #está en formato tibble
str(mpd2018)
head(mpd2018)
View(df)
# covert date to Date class
# mpd2018$year <- as.Date(mpd2018$year, format="%Y%M%D", origin="1")

#definir un subconjunto de datos
df <- subset(mpd2018, 
            year>=1950 & ##funciona con year en comillas y sin comillas
            countrycode %in% c("ARG", "CHL", "KOR" , "PHL"))

a<-"GDP per capita (1800-2010)"
ggplot(df, aes(x = year, y = cgdppc, color = country)) +
  geom_line(size = 0.8) +
    theme_bw() +
  xlim(1950,2017) +
  labs(x = NULL, y = "GDP per capita (1990 Int. GK dollars)\n", color = NULL,
       title = a)

?'%>%'

myfuncion<-function(a, b){
  df <- subset(mpd2018, 
               year>=a & 
                 countrycode %in% c("ARG", "CHL", "KOR" , "PHL"))
  ggplot(df, aes(x = year, y = cgdppc, color = country)) +
    geom_line(size = 0.8) +
    theme_bw() +
    xlim(a,b) +
    labs(x = NULL, y = "GDP per capita (1990 Int. GK dollars)\n", color = NULL,
         title = "GDP per capita")
  
}
a<-1950
b<-1980
paises<-c("ARG", "CHL", "KOR" , "PHL")
myfuncion(a,b)
paises  

