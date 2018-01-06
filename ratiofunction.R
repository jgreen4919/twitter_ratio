# Function for collecting pundits' ratios over however far back Twitter's API lets you collect them for free
# Function takes character vector "user", which is the pundit's Twitter handle, 
  # and character vector "platform", which is the home site where they publish their takes
# If no platform is provided, function will broaden its analysis to all of the user's tweets
  # option to set broaden to TRUE if platform is provided

ratio <- function(user, platform = NA, broaden = FALSE){
  require(rtweet)
  require(tidyverse)
  
  if(is.na(platform)){broaden = TRUE} # If no platform provided, broaden
  
  plength <- nchar(platform) # store character length of platform
  
  from <- search_tweets(paste("from:",user,sep = ""), n = 500, retryonratelimit = TRUE) # collect tweets sent by user
  
  if(broaden == FALSE){
    # if broaden is FALSE, filter tweets to only those that aren't quotes or RTs and do contain link to platform
    from <- from %>% filter(is_quote == FALSE & is_retweet == FALSE & 
                              substr(urls_url, start = 1, stop = plength) == platform)
  }else{
    # if broaden is TRUE, only filter out RTs
    from <- from %>% filter(is_retweet == FALSE & is.na(reply_to_user_id))
  }
  
  # collect tweets sent to the user
  to <- search_tweets(paste("to:",user,sep = ""), n = 10000, retryonratelimit = TRUE)
  
  # count how many tweets sent to the user, grouped by the tweet they're replying to
    # store grouped counts in new variable "ats"
  to <- to %>% group_by(reply_to_status_id) %>% mutate(ats = n())
  
  # merge replies to sent tweets
  from <- merge(from, to[,c("reply_to_status_id","ats")], by.x = "status_id", by.y = "reply_to_status_id")
  from <- unique(from) # pare down to remove duplicates
  
  # creat new variables
  from$posengage <- with(from, favorite_count + retweet_count) # positive engagements
  from$ratio1 <- with(from, ats / (favorite_count)) # ratio with just likes
  from$ratio2 <- with(from, ats / (posengage)) # ratio with likes and RTs
  
  return(from) # return dataset
}
