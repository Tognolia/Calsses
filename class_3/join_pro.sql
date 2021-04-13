use bank;
SELECT * FROM regional_unempl_rank u
where u.rank_u in (1,2,3);

#join 
#Q: can we get regional unempl. for each client
select * from client c
join district d
on c.district_id = d.A1;

#join more thatn two tables
#bridge join
select * from client c
join district d #right table
on c.district_id = d.A1
join regional_unempl_rank r #second right table
on d.A2 = r.A2;

#exercise bridge join
# List districts together with total amount borrowed and average loan amount.
select d.A2 , sum(l.loan_id), round(avg(l.amount)) as avgloan from loan l
join account a #right table
on l.account_id = a.account_id
join district d #second right table
on a.district_id = d.A1
group by d.A2;