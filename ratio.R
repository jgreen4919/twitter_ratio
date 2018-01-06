# THE RATIO
source("~/Desktop/rtweet/setup.R")
source("~/Desktop/rtweet/ratio/twitter_ratio/ratiofunction.R")

library(rtweet)
library(tidyverse)
library(ggplot2)

cillizza <- ratio(user = "CillizzaCNN", platform = "cnn.com")
cillizza1 <- ggplot(cillizza, aes(x = ats, y = favorite_count))
cillizza1 + geom_point() + geom_abline(slope = 1, intercept = 0)+
  xlab("Replies")+
  ylab("Faves")+
  ggtitle("Chris Cillizza's Take Ratios Since 1/4/17")+
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

