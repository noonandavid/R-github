
library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")


# initalise varibles
h = 7
org = gh("/users/john-smith",.token = "code",.limit = Inf)
classify <- 0
push_rec <- 0
pull_rec <- 0
issues_rec <- 0
delete_rec <- 0 
create_rec <- 0
fork_rec <- 0
prov_followers_list <- list()
prov_following_list <- list()
list_of_followers <- rep(list(list()),100)
list_of_following <- rep(list(list()),100)
list_of_repos <- list()

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

for (f in 2:length(list) ){
  ers_list[f] <- list[[f]]$followers_url
}


for (o in h:length(ers_list)){
    x <- gh(ers_list[[o]],.token = "code",.limit = Inf)
    for(f in 1:length(x)){
      list[[length(list)+1]] <- x[[f]]
    }
    h <- h + 1
    list <- unique(list)
  }
selection = list[300:400]
outlier = selection[[45]]
selection[[45]] = list [[403]]


for (p in 1:length(selection)){
  index <- selection[[p]]$repos_url
  reps <- gh(index,.token = "code",.limit = Inf)
  rep_nos[p] <- length(reps)
}

for (y in 1:length(selection)){
  index <- selection[[y]]$events_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  events <- gh(index,.token = "code",.limit = Inf)
  event_nos[y] = length(events)
  push = 0 
  pull = 0
  issues = 0
  create = 0
  delete = 0
  fork = 0
for (e in 1:length(events)){
  classify = events[[e]]
  if (classify != ""){
    if  (classify$type == "PushEvent")
    {push = push + 1}
    if  (classify$type == "PullRequestEvent")
    {pull = pull + 1}
    if  (classify$type == "IssuesEvent")
    {issues = issues + 1}
    if  (classify$type == "CreateEvent")
    {create = create + 1}
    if  (classify$type == "DeleteEvent")
    {delete = delete + 1}
    if  (classify$type == "ForkEvent")
    {fork = fork + 1}
  }}
pull_rec[y] = pull
push_rec[y] = push
issues_rec[y] = issues
create_rec[y] = create
delete_rec[y] = delete
fork_rec[y] = fork
}

for (a in 1:length(selection)){
  index <- selection[[a]]$followers_url
  followers <- gh(index,.token = "code",.limit = Inf)
  fol_nos[a] = length(followers)
  if (followers != ""){
  for (th in 1:length(followers)){
    prov_followers_list[th] <- followers[[th]]$login 
  }
  list_of_followers[[a]] <-prov_followers_list
  }}

for (b in 39:length(selection)){
  index <- selection[[b]]$following_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  following <- gh(index,.token = "code",.limit = Inf)
  foling_nos[b] = length(following)
  if (following != ""){
    for (th in 1:length(following)){
      prov_following_list[th] <- following[[th]]$login 
    }
    list_of_following[[b]] <-prov_following_list
  }
}


