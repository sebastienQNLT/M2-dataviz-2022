library(dplyr)
library(plotly)
library(ggplot2)
library(skimr)
library(stringr)

#load_data
load("fifadataset.Rdata")

my.fifa.dataset
my.fifa.dataset %>% glimpse
my.fifa.dataset %>% skim


my.fifa.dataset %>% group_by(league_name) %>% count
my.fifa.dataset %>% group_by(league_name) %>% summarize(overall=mean(overall, na.rm=TRUE))
my.fifa.dataset %>% group_by(league_name) %>% summarize(wage_eur=mean(wage_eur, na.rm=TRUE))
my.fifa.dataset %>% group_by(league_name) %>% summarize(wage_eur=max(wage_eur, na.rm=TRUE))
my.fifa.dataset %>% group_by(league_name) %>% summarize(wage_eur=median(wage_eur, na.rm=TRUE))

my.fifa.dataset %>% group_by(league_name) %>% summarize(value_eur=mean(value_eur, na.rm=TRUE))

plot_ly(data = my.fifa.dataset, x = ~overall, y = ~wage_eur, color=~league_name, text = ~paste("Player: ", long_name,"club_name :",  club_name))

plot_ly(data = my.fifa.dataset, x = ~overall, y = ~potential, color=~league_name, text = ~paste("Player: ", long_name,"club_name :",  club_name))


plot_ly(data = my.fifa.dataset, x = ~club_contract_valid_until, y = ~value_eur, color=~league_name, text = ~paste("Player: ", long_name,"club_name :",  club_name))


my.fifa.dataset %>%
  plot_ly(
    x = ~club_contract_valid_until,
    y = ~value_eur,
    split = ~club_contract_valid_until,
    type = 'violin',
    box = list(
      visible = T
    ),
    meanline = list(
      visible = T
    )
  ) 


my.fifa.dataset %>%
  plot_ly(
    x = ~league_name,
    y = ~wage_eur,
    split = ~league_name,
    type = 'violin',
    box = list(
      visible = T
    ),
    meanline = list(
      visible = T
    )
  ) 

