I wrote my program to be used to analyse a teams preformance. For my selection i just picked a person from github and started the process with him 
but i intended it to be used for a workplace or project.

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

I did this for shared followers, following and repos. For repos I also included a version that wasn't ajusted as i felt having the number of repos 
shared was a useful stastic to have.

This technique would be a lot more effective if I had some kind of connection between the people for example if I had a team or a company’s workforce.



The next graph I produced is a bar chart of each of the events and the number of each each person has such as issues, push and pull.
I also compared a few different events against each other to see if there is a correlation for example push and number of followers.




