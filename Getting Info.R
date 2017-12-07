
library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")


# initalise varibles
h = 7
org = gh("/users/john-smith",.token = "Auth code",.limit = Inf)
classify = 0
push_rec = 0
pull_rec = 0
issues_rec = 0


repos_list = org$repos_url
ers_list = org$followers_url
ing_list = org$following_url
ing_list =unlist(strsplit(ing_list, split='{', fixed=TRUE))[1]
events_list = org$events_url
events_list =unlist(strsplit(events_list, split='{', fixed=TRUE))[1]

lk = gh(repos_list[1],.token = "Auth code",.limit = Inf)
rep_nos = list(length(lk))
lk = gh(ers_list[1],.token = "Auth code",.limit = Inf)
fol_nos = list(length(lk))
lk = gh(ing_list[1],.token = "Auth code",.limit = Inf)
foling_nos = list(length(lk))
lk = gh(events_list[1],.token = "Auth code",.limit = Inf)
event_nos = list(length(lk))
pull_nos
push_nos

list <- gh("https://api.github.com/users/john-smith/followers",.token = "Auth code",.limit = Inf)

for (f in 2:length(list) ){
  ers_list[f] <- list[[f]]$followers_url
}


for (o in h:length(ers_list)){
    x <- gh(ers_list[[o]],.token = "Auth code",.limit = Inf)
    for(f in 1:length(x)){
      list[[length(list)+1]] <- x[[f]]
    }
    h <- h + 1
    list <- unique(list)
  }
selection = list[300:400]


for (p in 1:length(selection)){
  index <- selection[[p]]$repos_url
  reps <- gh(index,.token = "Auth code",.limit = Inf)
  rep_nos[p] <- length(reps)
}

for (a in 1:length(selection)){
  index <- selection[[a]]$followers_url
  followers <- gh(index,.token = "Auth code",.limit = Inf)
  fol_nos[p] <- length(followers)
}

for (b in 1:length(selection)){
  index <- selection[[46]]$following_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  following <- gh(index,.token = "Auth code",.limit = Inf)
  foling_nos[b] <- length(following)
}
  

for (y in 1:length(selection)){
  index <- selection[[y]]$events_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  events <- gh(index,.token = "Auth code",.limit = Inf)
  event_nos[y] <- length(events)
  push = 0 
  pull = 0
  issues = 0
  
  for (e in 1:length(events)){
    classify = events[[e]]
    if (classify != ""){
    if  (classify$type == "PushEvent")
    {push = push + 1}
    if  (classify$type == "PullRequestEvent")
    {pull = pull + 1}
    if  (classify$type == "IssuesEvent")
    {issues = issues + 1}
  }}
  pull_rec[y] = pull
  push_rec[y] = push
  issues_rec[y] = issues
  
}

classify
