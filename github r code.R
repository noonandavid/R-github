library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
remove_dups <- function(){
  names[!duplicated(names)]
  repos[!duplicated(repos)]
  fol_links[!duplicated(fol_links)]
}

next_person <- function(o) {
  
  x <- gh(fol_list[[o]],.token = "5e0f7bbfcc96ace79a7e1b2b3e5b89b1d9a81612",.limit = Inf)
  for (j in 1:length(x)){
    names = x[[j]]$login
    names_list = c(names,names_list)
    repos = x[[j]]$repos_url
    repos_list = c(repos,repos_list)
    fol_links = x[[j]]$followers_url
    fol_list = c(fol_list,fol_links)
  }
}




org = gh("/users/john-smith",.token = "2a916322b436f60513420840ebca417d99a3de16",.limit = Inf)
names_list = org$login
repos_list = org$repos_url
fol_list = org$followers_url
info
h <- 2
list <- org
list_fol <- gh("https://api.github.com/users/john-smith/followers",.token = "2a916322b436f60513420840ebca417d99a3de16",.limit = Inf)
for (i in 2:length(list_fol))
{
  use = list_fol[[i]]
  names <- use$login
  names_list = c(names,names_list)
  repos = list_fol[[i]]$repos_url
  repos_list = c(repos,repos_list)
  fol_links = list_fol[[i]]$followers_url
  fol_list = c(fol_list,fol_links)
  list <- c(list_fol,list)
}
for (u in 1: 30){
for (o in h:length(fol_list)){
x <- gh(fol_list[[o]],.token = "2a916322b436f60513420840ebca417d99a3de16",.limit = Inf)
for (j in 1:length(x)){
  names = x[[j]]$login
  names_list = c(names,names_list)
  repos = x[[j]]$repos_url
  repos_list = c(repos,repos_list)
  fol_links = x[[j]]$followers_url
  fol_list = c(fol_list,fol_links)
  list <- c(x,list)
  h <- h + 1
}
}
}

for (p in 1:length(names_list)){
 reps <- gh(repos_list[p],.token = "2a916322b436f60513420840ebca417d99a3de16",.limit = Inf)
 info[p] <- names_list[p]
 for (t in 1:length(reps))
  info[p] <- c(reps[[t]]$name,info)
}













