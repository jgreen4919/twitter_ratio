# THE RATIO
source("~/Desktop/rtweet/setup.R")
source("~/Desktop/rtweet/ratio/twitter_ratio/ratiofunction.R")

library(rtweet)
library(tidyverse)
library(ggplot2)

cillizza <- ratio(user = "CillizzaCNN", platform = "cnn", n_user = 500, n_at = 10000)
cillizza1 <- ggplot(cillizza, aes(x = favorite_count, y = ats))
cillizza1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Faves")+
  ylab("Replies")+
  ggtitle("Chris Cillizza's Take Ratios Since 12/29/17")+
  theme_bw()
mean(cillizza$ratio1)

lake <- ratio(user = "EliLake")
lake1 <- ggplot(lake, aes(x = ats, y = favorite_count))
lake1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Replies")+
  ylab("Faves")+
  ggtitle("Eli Lake's Take Ratios (Last 9 Days)")+
  theme_bw()

barro <- ratio(user = "jbarro")
barro1 <- ggplot(barro, aes(x = ats, y = favorite_count))
barro1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Replies")+
  ylab("Faves")+
  ggtitle("Josh Barro's Take Ratios (Last 9 Days)")+
  theme_bw()

benny <- ratio(user = "bennyjohnson", platform = "dailycaller.com")
benny1 <- ggplot(benny, aes(x = ats, y = favorite_count))
benny1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Replies")+
  ylab("Faves")+
  ggtitle("Benny Johnson's Take Ratios (Last 9 Days)")+
  theme_bw()

tpc <- ratio(user = "TPCarney", platform = "washingtonexaminer.com", broaden = TRUE)
tpc1 <- ggplot(tpc, aes(x = ats, y = favorite_count))
tpc1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Replies")+
  ylab("Faves")+
  ggtitle("Tim Carney's Take Ratios (Last 9 Days)")+
  theme_bw()

stephens <- ratio(user = "BretStephensNYT", platform = "nytimes", n_user = 500, n_at = 10000)
stephens1 <- ggplot(stephens, aes(x = favorite_count, y = ats))
stephens1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Faves")+
  ylab("Replies")+
  ggtitle("Bret Stephens's Take Ratios Since 12/29/17")+
  theme_bw()
mean(stephens$ratio1)

nyt <- ratio(user = "nytopinion", n_user = 100, n_at = 10000)
nyt <- nyt[which(nyt$status_id == "948708245354569728"):nrow(nyt),]
nyt1 <- ggplot(nyt, aes(x = favorite_count, y = ats))
nyt1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Faves")+
  ylab("Replies")+
  ggtitle("NYT Opinion Ratios since 1/4/18")+
  theme_bw()
