use sakila;

#rental
#what is the avg duration expressed in hh:mm format?
select floor(avg(length)/60) as hours + avg((length)%60) as minute)
from film
order by length;

select datediff(min(rental_date), curdate()) from rental;

INSERT INTO `bank`.`account`
(`account_id`,
`district_id`,
`frequency`,
`date`)
VALUES
(<{account_id: }>,
<{district_id: }>,
<{frequency: }>,
<{date: }>);

select * from customer
where active = 0;
# create new subtable