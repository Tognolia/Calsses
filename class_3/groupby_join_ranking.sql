use bank;
select  sum(amount) from loan;
select sum(payments) from loan;
# group by is giving you a "oer each" result
#you can devide the aggregation fun like avg, sum, etc by groups
# always after the where statement
#is followed by having
#where > group by > having 
select account_id, sum(amount) from loan
group by account_id;

#Q: what is the avg amount recovered from loans per each status
select status, round(avg(payments),2) as avg_paid
 from loan 
 group by status;
 
 #what is the avg amount from loans per each status?
 select status, round(avg(amount) - avg(payments),2) as avg_loan
 from loan 
 group by status;
 
  #what is the avg amount from loans per each status and duration?
 select status, duration, round(avg(amount) - avg(payments),2) as avg_loan
 from loan 
 where status in ('B','C')
 group by status, duration
 order by duration;
 
 #class activity
select sum(card_id) as tot_card from card;

select district_id,count(account_id) as tot_clients from account 
group by district_id
having count(*) ;

select type, round(avg(amount),2) from trans 
group by type

select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
where k_symbol <> ' ' #is not null in case they are null
#where k_symbol  in ('UROK','DUCHOD','POJISTNE','SIPO','UVER', 'SANKC. UROK','SLUZBY')
group by type, operation, k_symbol
order by type, operation, k_symbol;

#HAVING
select c.district_id, count(*) as num_customers
from bank.client c
group by c.district_id 
having count(*) > 100
order by num_customers desc;

#having 2
select c.district_id, count(*) as num_customers
from bank.client c
group by c.district_id 
having count(*) > 100
order by num_customers desc;

#class activiti
select duration, round(sum(amount-payments),2) as unpaid from loan
group by duration
having round(sum(amount-payments),2) > 1000000;

#IF Statement
#if(condition, value_if_true, value_if_false)
select *, IF(A10>80, 'suburb', 'urban') as locale from district

CREATE TABLE `account` (
  `account_id` int NOT NULL,
  `district_id` int DEFAULT NULL,
  `frequency` text COLLATE utf8mb4_unicode_ci,
  `date` int DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;







