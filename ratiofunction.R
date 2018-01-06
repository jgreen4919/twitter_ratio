ratio <- function(user, platform = NA, broaden = FALSE){
  require(rtweet)
  require(tidyverse)
  
  if(is.na(platform)){broaden = TRUE}
  
  plength <- nchar(platform)
  
  from <- search_tweets(paste("from:",user,sep = ""), n = 500, retryonratelimit = TRUE)
  
  if(broaden == FALSE){
    from <- from %>% filter(is_quote == FALSE & is_retweet == FALSE & 
                              substr(urls_url, start = 1, stop = plength) == platform)
  }else{
    from <- from %>% filter(is_retweet == FALSE & is.na(reply_to_user_id))
  }
  
  to <- search_tweets(paste("to:",user,sep = ""), n = 10000, retryonratelimit = TRUE)
  to <- to %>% group_by(reply_to_status_id) %>% mutate(ats = n())
  
  from <- merge(from, to[,c("reply_to_status_id","ats")], by.x = "status_id", by.y = "reply_to_status_id")
  from <- unique(from)
  
  from$posengage <- with(from, favorite_count + retweet_count)
  from$ratio1 <- with(from, ats / (favorite_count))
  from$ratio2 <- with(from, ats / (posengage))
  
  return(from)
}
