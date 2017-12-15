
library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")


# initalise varibles
h = 7

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
list_of_names <- vector(length=100)
connections <- vector()

rep_nos <- vector()
cov_ers <- matrix(, nrow = 100, ncol = 100)
cov_ing <- matrix(,nrow = 100, ncol = 100)
cov_repos <- matrix(,nrow = 100, ncol = 100)
cov_repos_ajust <- matrix(,nrow = 100, ncol = 100)
cov_ing_ajust <- matrix(,nrow = 100, ncol = 100)
cov_ers_ajust <- matrix(,nrow = 100, ncol = 100)
recip <- vector()
ing_list <- list()
fol_nos <- vector()
foling_nos <- vector()
event_nos <- vector()




list <- gh("https://api.github.com/users/ScottKillen/following",.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)

for (i in 1:length(list)){
    x <- gh(as.character(list[[i]][7]),.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
    for(f in 1:length(x)){
      list[[length(list)+1]] <- x[[f]]
    }
   
    list <- unique(list)
}
selection = list[100:200]


for (i in 1:length(selection)){
  index <- as.character(selection[[i]][14])
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  events <- gh(index,.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
  event_nos[i] = length(events)
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
  
for (i in 1:length(events)){
 
  classify =events[[i]][2]
 {
   if (!is.na(classify)){
    if  (classify == "PushEvent")
    {push = push + 1}
    if  (classify == "PullRequestEvent")
    {pull = pull + 1}
    if  (classify == "PullRequestReviewEvent")
    {pull_review = pull_review + 1}
    if  (classify == "PullRequestReviewCommentEvent")
    {pull_review_comment = pull_review_comment + 1}
    if  (classify == "IssuesEvent")
    {issues = issues + 1}
    if  (classify == "IssuesCommentEvent")
    {issues_comment = issues_comment + 1}
    if  (classify == "CreateEvent")
    {create = create + 1}
    if  (classify == "DeleteEvent")
    {delete = delete + 1}
    if  (classify == "ForkEvent")
    {fork = fork + 1}
    if  (classify == "OrganizationEvent")
    {org_event = org_event + 1}
    if  (classify == "ProjectEvent")
    {project_event = project_event + 1}
  }}
  }
pull_rec[i] = pull
push_rec[i] = push
pull_review_rec[i] = pull_review
pull_review_comment_rec[i] = pull_review_comment
issues_rec[i] = issues
issues_comment_rec[i] = issues_comment
org_event_rec[i] = org_event
create_rec[i] = create
delete_rec[i] = delete
fork_rec[i] = fork
project_event_rec[i] = project_event
}

for (i in 1:length(selection)){
  index <- as.character(selection[[i]][7])
  followers <- gh(index,.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
  fol_nos[i] = length(followers)
  if (length(followers) != 0){
    count = 1
    prov_followers_list = list()
  for (th in 1:length(followers)){
    prov_followers_list[count] <- as.character(followers[[th]][1])
    count <- count + 1;
  }
  }
  list_of_followers[[i]] <-prov_followers_list
}

for (i in 1:length(selection)){
  index <- as.character(selection[[i]][8])
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  following <- gh(index,.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
  foling_nos[i] = length(following)
  if (length(following) != 0){
    count = 1
    prov_following_list = list()
    for (th in 1:length(following)){
      prov_following_list[count] = as.character(following[[th]][1]) 
      count <- count + 1;
    }
    list_of_following[[i]] <-prov_following_list
  }else (list_of_following[[i]] = 0)
  
}

for (i in 1:length(selection)){
  index <- as.character(selection[[i]][13])
  index = unlist(strsplit(index, split='{', fixed=TRUE))[1]
  repos <- gh(index,.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
  rep_nos[i] = length(repos)
  if (repos != ""){
    count = 1
    prov_repos_list = list()
    for (th in 1:length(repos)){
      prov_repos_list[th] <- repos[[th]]$name 
      count <- count + 1;
    }
    list_of_repos[[i]] <-prov_repos_list
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


list_of_names <- rownames(cov_ers_ajust)
list_of_names <- colnames(cov_ers_ajust)

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


for (i in 1:100){
  list_of_names[i] <- as.character(selection[[i]][1])
}

count = 1 
for (i in 1:100){
  if (length(list_of_following[[i]] != 0)){
  for (j in 1:length(list_of_following[[i]])){
      if ( list_of_following[[i]][j] %in% list_of_names){
       connections[count] <- paste(list_of_names[i],",",list_of_following[[i]][j])
        count <- count + 1
     }
    }
  }
}



 