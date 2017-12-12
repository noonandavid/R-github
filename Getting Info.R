
library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")


# initalise varibles
h = 7
org = gh("/users/john-smith",.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
classify <- 0
push_rec <- 0
pull_rec <- 0
issues_rec <- 0
delete_rec <- 0 
create_rec <- 0
fork_rec <- 0
issues_comment_rec <- 0
org_event_rec <- 0
project_event_rec <- 0
pull_review_rec <- 0
pull_review_comment_rec <- 0
prov_followers_list <- list()
prov_following_list <- list()
prov_repos_list <- list()
list_of_repos <- rep(list(list()),100)
list_of_followers <- rep(list(list()),100)
list_of_following <- rep(list(list()),100)


cov_ers <- matrix(, nrow = 100, ncol = 100)
cov_ing <- matrix(,nrow = 100, ncol = 100)
cov_repos <- matrix(,nrow = 100, ncol = 100)
cov_repos_ajust <- matrix(,nrow = 100, ncol = 100)
cov_ing_ajust <- matrix(,nrow = 100, ncol = 100)
cov_ers_ajust <- matrix(,nrow = 100, ncol = 100)
recip <- vector()

repos_list = org$repos_url
ers_list = org$followers_url
ing_list = org$following_url
ing_list =unlist(strsplit(ing_list, split='{', fixed=TRUE))[1]
events_list = org$events_url
events_list =unlist(strsplit(events_list, split='{', fixed=TRUE))[1]

lk = gh(repos_list[1],.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
rep_nos = list(length(lk))
lk = gh(ers_list[1],.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
fol_nos = list(length(lk))
lk = gh(ing_list[1],.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
foling_nos = list(length(lk))
lk = gh(events_list[1],.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
event_nos = list(length(lk))

list <- gh("https://api.github.com/users/john-smith/followers",.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)

for (f in 2:length(list) ){
  ers_list[f] <- list[[f]]$followers_url
}


for (o in h:length(ers_list)){
    x <- gh(ers_list[[o]],.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
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
  reps <- gh(index,.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
  rep_nos[p] <- length(reps)
}

for (y in 1:length(selection)){
  index <- selection[[y]]$events_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  events <- gh(index,.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
  event_nos[y] = length(events)
  push = 0 
  pull = 0
  pull_review = 0
  pull_review_comment = 0
  issues = 0
  issues_comment = 0
  create = 0
  delete = 0
  fork = 0
  org_event = 0
  project_event = 0
  
for (e in 1:length(events)){
  classify = events[[e]]
  if (classify != ""){
    if  (classify$type == "PushEvent")
    {push = push + 1}
    if  (classify$type == "PullRequestEvent")
    {pull = pull + 1}
    if  (classify$type == "PullRequestReviewEvent")
    {pull_review = pull_review + 1}
    if  (classify$type == "PullRequestReviewCommentEvent")
    {pull_review_comment = pull_review_comment + 1}
    if  (classify$type == "IssuesEvent")
    {issues = issues + 1}
    if  (classify$type == "IssuesCommentEvent")
    {issues_comment = issues_comment + 1}
    if  (classify$type == "CreateEvent")
    {create = create + 1}
    if  (classify$type == "DeleteEvent")
    {delete = delete + 1}
    if  (classify$type == "ForkEvent")
    {fork = fork + 1}
    if  (classify$type == "OrganizationEvent")
    {org_event = org_event + 1}
    if  (classify$type == "ProjectEvent")
    {project_event = project_event + 1}
    
  }}
pull_rec[y] = pull
push_rec[y] = push
pull_review_rec[y] = pull_review
pull_review_comment_rec[y] = pull_review_comment
issues_rec[y] = issues
issues_comment_rec[y] = issues_comment
org_event_rec[y] = org_event
create_rec[y] = create
delete_rec[y] = delete
fork_rec[y] = fork
project_event_rec[y] = project_event
}

for (a in 1:length(selection)){
  index <- selection[[a]]$followers_url
  followers <- gh(index,.token = "c669f0f3b75700c4635db08ff9670166a9954230",limit = Inf)
  fol_nos[a] = length(followers)
  if (followers != ""){
    count = 1
    prov_followers_list = list()
  for (th in 1:length(followers)){
    prov_followers_list[count] <- followers[[th]]$login 
    count <- count + 1;
  }
  list_of_followers[[a]] <-prov_followers_list
  }
}

for (b in 1:length(selection)){
  index <- selection[[b]]$following_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  following <- gh(index,token = "c669f0f3b75700c4635db08ff9670166a9954230",limit = Inf)
  foling_nos[b] = length(following)
  if (following != ""){
    count = 1
    prov_following_list = list()
    for (th in 1:length(following)){
      prov_following_list[count] = following[[th]]$login 
      count <- count + 1;
    }
    list_of_following[[b]] <-prov_following_list
  }
}

for (b in 1:length(selection)){
  index <- selection[[b]]$repos_url
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  repos <- gh(index,.token = "c669f0f3b75700c4635db08ff9670166a9954230",.limit = Inf)
  rep_nos[b] = length(repos)
  if (repos != ""){
    count = 1
    prov_repos_list = list()
    for (th in 1:length(repos)){
      prov_repos_list[th] <- repos[[th]]$name 
      count <- count + 1;
    }
    list_of_repos[[b]] <-prov_repos_list
  }
}


for (i in 1:100){
  for(j in 1:100){
    if (i != j){
      cov_ers[i,j] <- length(intersect(list_of_followers[[i]],list_of_followers[[j]]))
      cov_ers_ajust[i,j] <- as.numeric(cov_ers[i,j])/as.numeric(fol_nos[i])
    }
  }
}
for (i in 1:100){
  for(j in 1:100){
    if (i != j){
      cov_ing[i,j] <- length(intersect(list_of_following[[i]],list_of_following[[j]]))
      cov_ing_ajust[i,j] <- as.numeric(cov_ing[i,j])/as.numeric(foling_nos[i])
    }
  }
}
for (i in 1:100){
      recip[i] <- length(intersect(list_of_followers[[i]],list_of_following[[i]]))
      
}
for (i in 1:100){
  for(j in 1:100){
    if (i != j){
      cov_repos[i,j] <- length(intersect(list_of_repos[[i]],list_of_repos[[j]]))
      cov_repos_ajust[i,j] <- as.numeric(cov_repos[i,j])/as.numeric(rep_nos[i])
    }
  }
}

recip
