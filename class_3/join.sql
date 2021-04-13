use bank;
#I join the account_id on the loan table
#this is matching only the intersection between the two tables
#only loan_id (PK)which have an account_id(FK)
select * from account a 
join bank.loan l
on a.account_id = l.account_id
where l.duration = 12