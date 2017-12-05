library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")



# initalise varibles
h = 2
org = gh("/users/john-smith",.token = "code",.limit = Inf)


repos_list = org$repos_url
ers_list = org$followers_url
ing_list = org$following_url
ing_list =unlist(strsplit(ing_list, split='{', fixed=TRUE))[1]
events_list = org$events_url
events_list =unlist(strsplit(events_list, split='{', fixed=TRUE))[1]

lk = gh(repos_list[1],.token = "code",.limit = Inf)
rep_nos = list(length(lk))
lk = gh(ers_list[1],.token = "code",.limit = Inf)
fol_nos = list(length(lk))
lk = gh(ing_list[1],.token = "code",.limit = Inf)
foling_nos = list(length(lk))
lk = gh(events_list[1],.token = "code",.limit = Inf)
event_nos = list(length(lk))


list <- gh("https://api.github.com/users/john-smith/followers",.token = "code",.limit = Inf)



for (u in 1: 10){
  for (o in h:length(fol_list)){
    x <- gh(ers_list[[o]],.token = "code",.limit = Inf)
    for(f in 1:length(x)){
      list[[length(list)+1]] <- x[[f]]
    }
    h <- h + 1
    list <- unique(list)
  }
}



for (p in 2:length(list)){
  index <- list[[p]]$repos_url
  reps <- gh(index,.token = "code",.limit = Inf)
  rep_nos[p] <- length(reps)
}

for (p in 2:length(list)){
  index <- list[[p]]$followers_url
  followers <- gh(index,.token = "code",.limit = Inf)
  fol_nos[p] <- length(followers)
}
foling_nos = 0
for (b in 2:length(list)){
  index <- list[[5]]$following_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  following <- gh("index",.token = "code",.limit = Inf)
  foling_nos[b] <- length(following)
}
  
foling_nos = 0
for (b in 2:length(list)){
  index <- list[[5]]$events_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  events <- gh("https://api.github.com/users/m19cmjigen/following",.token = "code",.limit = Inf)
  event_nos[b] <- length(events)
}






