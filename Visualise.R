library(ggplot2)
library(reshape2)


 melted_cormat <- melt(cov_ing)
 head(melted_cormat)
 ggplot(data = melted_cormat, aes(fill=value)) + 
   geom_tile()

 
 melted_cormats <- melt(cov_ers)
 head(melted_cormats)
 ggplot(data = melted_cormats, aes(x=Var1, y=Var2, fill=value,)) + 
   geom_tile()
 
 
 melted_repos <- melt(cov_repos)
 head(melted_repos)
 ggplot(data = melted_repos, aes(x=Var1, y=Var2, fill=value)) + 
   geom_tile()
 
 melted_repos_ajust <- melt(cov_repos_ajust)
 head(melted_repos_ajust)
 ggplot(data = melted_repos_ajust, aes(x=Var1, y=Var2, fill=value)) + 
   geom_tile()
 
 melted_ing_ajust <- melt(cov_ing_ajust)
 head(melted_ing_ajust)
 ggplot(data = melted_ing_ajust, aes(x=Var1, y=Var2, fill=value)) + 
   geom_tile()
 
qplot(recip)
qplot(issues_rec)
qplot(pull_rec)
qplot(push_rec)
qplot(issues_rec)
