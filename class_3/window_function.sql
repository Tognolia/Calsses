#Ranks
#Build on top of the previous query and rank films by length within the rating category (filter out the rows that 
#have nulls or 0s in length column). 
#In your output, only select the columns title, length, rating and the rank.
select  title, length, RANK() over (order by length ASC)
 from film;
 # in this case there are many rows with the same rank. It happen when we use the normal rank
 select  title, length, DENSE_RANK() over (order by length ASC)
 from film;
 #if we want to split the rank for each category or rating, then we use partition by
select  rating, title, length, DENSE_RANK() over (partition by rating order by length ASC)
 from film;

#challenge 1
use bank;
select  A2,A3, A11,A12, dense_rank() over (order by A11 desc) 
from district ;
#challenge 2
select  A2,A3, A11,A12, dense_rank() over (partition by A3 order by A12 asc) 
from district ;
#challenge 3
#create view
create view regional_unempl_rank as
select  A2,A3, A11,A12, dense_rank() over (partition by A3 order by A12 asc) 
from district ;
#create tempora table
create temporary table  temp_ditrict_rank as
select  A2,A3, A11,A12, dense_rank() over (order by A11 desc) 
from district ;

select * from temp_ditrict_rank;

#




 
 
 
 