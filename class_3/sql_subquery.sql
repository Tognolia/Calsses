use bank;

#excercise 1
# return id where the aount loaned is higher than the avg
# reccomand to create the subquery first and thensubstitute it in the outter query.                   
select duration, sum(amount) from loan
where amount > (select avg(amount) from loan) #subquery, make it as first step.
group by duration 

# find thoise banks from banks table where avg trans is > 5000
select bank, avg(amount) as avg from trans
where bank is not null and bank <> ''
group by bank
having (select avg(amount) from trans) > 5000

#activity                
select account_id, count(trans_id) as numtrans
 from trans 
 group by account_id
 having numtrans > ( 
 select floor(avg(numtrans)) from
 (select account_id, count(trans_id) as numtrans
 from trans 
 group by account_id) q1
 
 )



