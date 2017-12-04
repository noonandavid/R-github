library("gh", lib.loc="/Library/Frameworks/R.framework/Versions/3.3/Resources/library")
remove_dups <- function(){
  names[!duplicated(names)]
  repos[!duplicated(repos)]
  fol_links[!duplicated(fol_links)]
}

next_person <- function(o) {
  
  x <- gh(fol_list[[o]],.token = "135560db377301a3f5f3c7f4134e3824806c55e4",.limit = Inf)
  for (j in 1:length(x)){
    list <- c(x,list)
  }
}



# initalise varibles
org = gh("/users/john-smith",.token = "135560db377301a3f5f3c7f4134e3824806c55e4",.limit = Inf)
names_list = org$login
repos_list = org$repos_url
fol_list = org$followers_url
lk = gh(repos_list[1],.token = "135560db377301a3f5f3c7f4134e3824806c55e4",.limit = Inf)
info = list(length(lk))
h <- 2
list <- gh("https://api.github.com/users/john-smith/followers",.token = "135560db377301a3f5f3c7f4134e3824806c55e4",.limit = Inf)





for (i in h:length(list))
{
  use = list[[i]]
  names <- use$login
  names_list = c(names,names_list)
  repos = list[[i]]$repos_url
  repos_list = c(repos,repos_list)
  fol_links = list[[i]]$followers_url
  fol_list = c(fol_list,fol_links)
}



for (u in 1: 6){
  for (o in h:length(fol_list)){
    x <- gh(fol_list[[o]],.token = "135560db377301a3f5f3c7f4134e3824806c55e4",.limit = Inf)
      for(f in 1:length(x)){
        list[[length(list)+1]] <- x[[f]]
      }
      h <- h + 1
      unique <- unique(list)
  }
}

for (p in 1:length(list)){
  reps <- gh(repos_list[p],.token = "135560db377301a3f5f3c7f4134e3824806c55e4",.limit = Inf)
  info[p] <- names_list[p]
  for (t in 1:length(reps))
    info[p] <- c(reps[[t]]$name,info)
}
for (j in 1:length(x)){
  names = x[[j]]$login
  names_list = c(names,names_list)
  repos = x[[j]]$repos_url
  repos_list = c(repos,repos_list)
  fol_links = x[[j]]$followers_url
  fol_list = c(fol_list,fol_links)
}




