David Noonan       15320927


Github Api Project

I wrote my program to be used to analyse a teams preformance. For my selection i just picked a person from github and started the process with him 
but i intended it to be used for a workplace or project. I limited my selection to 100 people but if it was in a closed loop this would not be nessassary.
To run the code you will need to install a few packages in r 
For the getting info file you will need the gh package
For the visualise you will need the ggplot2, reshape2 and plotly packages 
All of these are avalable on CRAN

For the matrix graphs I retrieved a list of all of the followers each person has.
I now have two lists of followers for each person.
I then ran a compare function to see the overlap between the two.
I divided the overlap number by the overall number of followers for each person.
 I did this for all possible combinations of people from 1 to 100.
This gave me a matrix showing the proportion of followers shared be each person.
I then named the axis's after the list of names.
I then used ggplots2 to graph the matrix in colour. 
Lastly I graphed it using plotly so it would be interactive.
This means you can hover your mouse over a point and see the names of the two people which are being compared.

Here are non interactive versions 


![shared folllowing](https://user-images.githubusercontent.com/32358791/34043922-d95571fe-e19a-11e7-8f11-b23b609c3eac.png)
![shared followers](https://user-images.githubusercontent.com/32358791/34043924-d9709006-e19a-11e7-9d52-3df7a8b8b384.png)
![shared repositorys](https://user-images.githubusercontent.com/32358791/34043925-d988e7be-e19a-11e7-9fff-01c2053086d2.png)

Here are the links for the interactive grids:

https://macneill.scss.tcd.ie/~noonanda/following_grid_ajust.html

https://macneill.scss.tcd.ie/~noonanda/followers_grid_ajust.html

https://macneill.scss.tcd.ie/~noonanda/repos_grid.html

https://macneill.scss.tcd.ie/~noonanda/repos_grid_ajust.html



I did this for shared followers, following and repos. For repos I also included a version that wasn't ajusted as i felt having the number of repos 
shared was a useful stastic to have.

This technique would be a lot more effective if I had some kind of connection between the people for example if I had a team or a company’s workforce.



The next graph I produced is a bar chart of each of the events and the number of each each person has such as issues, push and pull.
I also compared a few different events against each other to see if there is a correlation for example push and number of followers.


![issues graph](https://user-images.githubusercontent.com/32358791/34043916-d8b0fc6e-e19a-11e7-9e4a-c3d90dcd1f02.png)
![pullgraph](https://user-images.githubusercontent.com/32358791/34043917-d8ca086c-e19a-11e7-968a-753c40bf8256.png)
![pullvsevents](https://user-images.githubusercontent.com/32358791/34043918-d8e1586e-e19a-11e7-9162-fbb08f48cd7e.png)
![pullvsno offollowers](https://user-images.githubusercontent.com/32358791/34043919-d8f8ce2c-e19a-11e7-9a4a-2e61f620b5e6.png)
![pushgraph](https://user-images.githubusercontent.com/32358791/34043920-d91117e8-e19a-11e7-85a9-f0bde9835408.png)
![pushvsissues](https://user-images.githubusercontent.com/32358791/34043921-d941a066-e19a-11e7-86ce-7dec28d6f78f.png)

