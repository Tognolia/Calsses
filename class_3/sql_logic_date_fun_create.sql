#creating new db
# create, drop, alter, truncate, comment, rename
create database bank_demo;
create table bank_demo.account(
account_id int(11) unique not null,
district_id int(11) default null
)

#insert 
insert into bank_demo.account values
(1,4),(2,4),(3,2);

alter bankk.trans.issued as convert---

