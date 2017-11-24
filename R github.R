library(gh)
e  = 1
x <- c("https://api.github.com/users/torvalds/followers")
while (e != 2){
 i = 1
   a = "https://api.github.com/users/hadley/followers"
  b = "?page="
  c = "&per_page=100'"
  url1 <- paste0(a, b, i, c)
  json<-fromJSON(url1)
  folurl <- json$followers_url
  if (length(folurl) == 0 ){e = 2}
  x <- c(x,folurl)
  
    
  i <- i+1
}
