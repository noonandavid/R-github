library(ggplot2)
library(reshape2)
library(plotly)


 melted_cormat <- melt(cov_ing)
 head(melted_cormat)
 followers_grid <- ggplotly(ggplot(data = melted_cormat, aes(fill=value)) + 
   geom_tile()  + scale_fill_gradient(low = "white",high = "red") + labs(x = "Shared Following", y = "Covariance Matrix")+ theme(
     axis.text.x=element_blank(), axis.text.y=element_blank(), axis.ticks=element_blank(),))

 
 melted_cormats <- melt(cov_ers)
 head(melted_cormats)
 following_grid <- ggplotly(ggplot(data = melted_cormats, aes(x=Var1, y=Var2, fill=value,)) + 
   geom_tile()  + scale_fill_gradient(low = "white",high = "red") + labs(x = "Shared Following", y = "Covariance Matrix")+ theme(
     axis.text.x=element_blank(), axis.text.y=element_blank(), axis.ticks=element_blank(),))
 
 
 melted_repos <- melt(cov_repos)
 head(melted_repos)
 repos_grid <- ggplotly(ggplot(data = melted_repos, aes(x=Var1, y=Var2, fill=value)) + 
   geom_tile()  + scale_fill_gradient(low = "white",high = "red") + labs(x = "Shared Following", y = "Covariance Matrix")+ theme(
     axis.text.x=element_blank(), axis.text.y=element_blank(), axis.ticks=element_blank(),))
 
 
 
 melted_ers_ajust <- melt(cov_ing_ajust)
 head(melted_ers_ajust)
 following_grid_ajust <- ggplotly(ggplot(data = melted_ers_ajust, aes(x=Var1, y=Var2, fill=value)) + 
   geom_tile() + scale_fill_gradient(low = "white",high = "red") + labs(x = "Shared Following", y = "Covariance Matrix")+ theme(
axis.text.x=element_blank(), axis.text.y=element_blank(), axis.ticks=element_blank(),))
                                                                                                                               

 melted_ers_ajust <- melt(cov_ers_ajust)
 head(melted_ers_ajust)
 followers_grid_ajust <- ggplotly(ggplot(data = melted_ers_ajust, aes(x=Var1, y=Var2, fill=value)) + 
   geom_tile() + scale_fill_gradient(low = "white",high = "red") + labs(x = "Shared Followers", y = "Covariance Matrix")+ theme(
     axis.text.x=element_blank(), axis.text.y=element_blank(), axis.ticks=element_blank(),))
 
 melted_repos_ajust <- melt( cov_repos_ajust )
 head(melted_repos_ajust)
 repos_grid_ajust <- ggplotly(ggplot(data = melted_repos_ajust, aes(x=Var1, y=Var2, fill=value)) + 
   geom_tile() + scale_fill_gradient(low = "white",high = "red") + labs(x = "Shared Repositorys", y = "Covariance Matrix")+ theme(
     axis.text.x=element_blank(), axis.text.y=element_blank(), axis.ticks=element_blank(),))
 

 

qplot(issues_rec)+ labs(x = "Amount",y = "Issue Events Recorded")
qplot(pull_rec)+ labs(x = "Amount",y = "Pull Events Recorded")
qplot(push_rec)+ labs(x = "Amount",y = "Push Events Recorded")
qplot(issues_rec,pull_rec,push_rec)+ labs(x = "Issues Events",y = "Push Events")
qplot(pull_rec,push_rec)+ labs(x = "Pull Events",y = "Push Events")
qplot(foling_nos,push_rec)
qplot(foling_nos,pull_rec)
qplot(foling_nos,push_rec)+ labs(x = "Number of Follower",y = "Push Events")
qplot(foling_nos,pull_rec)+ labs(x = "Number of Followers",y = "Pull Events")
qplot(create_rec,delete_rec)


htmlwidgets::saveWidget(repos_grid_ajust, "repos_grid_ajust.html")
htmlwidgets::saveWidget(followers_grid_ajust, "followers_grid_ajust.html")
htmlwidgets::saveWidget(following_grid_ajust, "following_grid_ajust.html")
htmlwidgets::saveWidget(repos_grid, "repos_grid.html")
htmlwidgets::saveWidget(followers_grid, "followers_grid.html")
htmlwidgets::saveWidget(following_grid, "following_grid.html")
