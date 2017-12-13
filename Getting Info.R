
library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")


# initalise varibles
h = 7
org = gh("/users/noonandavid",.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
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




list <- gh("https://api.github.com/users/noonandavid/following",.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
for (j in 1:5){
for (i in 1:length(list)){
    x <- gh(list[[i]]$followers_url,.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
    for(f in 1:length(x)){
      list[[length(list)+1]] <- x[[f]]
    }
    h <- h + 1
    list <- unique(list)
}}
selection = list[1:100]


for (i in 1:length(selection)){
  index <- selection[[i]]$repos_url
  reps <- gh(index,.token = "e77e44038f114dd9f2cd2d5ea52c6abf250d23e5",.limit = Inf)
  rep_nos[i] <- length(reps)
}

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
  classify = events[[i]]
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
  if (followers != ""){
    count = 1
    prov_followers_list = list()
  for (th in 1:length(followers)){
    prov_followers_list[count] <- followers[[th]]$login 
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
  if (following != ""){
    count = 1
    prov_following_list = list()
    for (th in 1:length(following)){
      prov_following_list[count] = following[[th]]$login 
      count <- count + 1;
    }
  }
  list_of_following[[i]] <-prov_following_list
}

for (i in 1:length(selection)){
  index <- selection[[i]][13]
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

write.csv(connections, file = "data.csv")
?write.csv
