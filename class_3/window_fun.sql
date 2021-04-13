use bank;
select * from loan;
#rank
#over and partition by
select loan_id, account_id, amount, payments, duration,
 amount-payments as "Balance",
 #window function
rank( avg(amount-payments)) over (partition by duration) as "Avg_Balance" #create an avg for each duration
from bank.loan
where amount > 100000
order by duration, balance desc;

#add rank col
select *, ran