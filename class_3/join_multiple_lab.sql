use sakila;
#join more thatn two tables
#1
select city, store_id ,country from store s
join address a  #right table
on s.address_id = a.address_id
join city c #second right table
on a.city_id = c.city_id
join country co
on c.country_id=co.country_id;
#2
select s.store_id,sum(amount) from store s
join staff st  #right table
on s.store_id = st.store_id
join payment p #second right table
on p.staff_id = p.staff_id
group by s.store_id;
#3
select c.name,avg(length) from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id= c.category_id
group by fc.category_id
order by avg(length) desc;
#4
select title, count(r.rental_id) from film f
join inventory i
on f.film_id = i.film_id
join rental r
on i.inventory_id=r.inventory_id
group by title
order by count(r.rental_id) desc
limit 2;

#5
select c.name, sum(p.amount) from category c
join film_category fc
on c.category_id= fc.category_id
join film f
on fc.film_id=f.film_id
join inventory i
on f.film_id= i.film_id
join rental r
on i.inventory_id= r.inventory_id
join payment p 
on p.rental_id=r.rental_id
group by c.name
order by sum(p.amount) desc
limit 5;

#6
select max(r.return_date),f.title from category c
join film_category fc
on c.category_id= fc.category_id
join film f
on fc.film_id=f.film_id
join inventory i
on f.film_id= i.film_id
join rental r
on i.inventory_id= r.inventory_id
where f.title = 'Academy Dinosaur' and store_id = 1;


