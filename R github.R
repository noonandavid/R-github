library("httpuv", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
library("httr", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
library("jsonlite", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
#5e0f7bbfcc96ace79a7e1b2b3e5b89b1d9a81612 
info  <- fromJSON("https://api.github.com/users/torvalds")
e  = 1
list_of_followers <- c("https://api.github.com/users/torvalds/followers")
list_of_reps <- c("https://api.github.com/users/torvalds/repos")
while (e != 2){
 i = 1
   a = "https://api.github.com/users/hadley/followers"
  b = "?page="
  c = "&per_page=100'"
  url1 <- paste0(a, b, i, c)
  web <- GET(url1)
  json <-fromJSON(web)
  repurl <- json$repos_url
  folurl <- json$followers_url
  #if (length(folurl) == 0 ){e = 2}
  list_of_followers <- c(list_of_followers,folurl)
  list_of_reps <- c(list_of_reps,repurl)
  i <- i+1
  list_of_followers[!duplicated(list_of_followers) ]
}
web
?GET
