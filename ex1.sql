create table branch(b_id serial primary key,
			bname varchar(10),
			city varchar(10));
===============================================================
create table customer(c_id serial primary key,
			cname varchar(10),
			city varchar(10));
===============================================================
create table deposit( acc_no int ,
			c_id int references customer(c_id),
			b_id int references branch(b_id),
			amount int,
			date_d date);




create table borrow( loan_no int ,
			c_id int references customer(c_id),
			b_id int references branch(b_id),
			amount int,
			date_b date);



++++==================++++++++++++++=====

insert into branch(bname,city)
values('SBI','trivandrum'),
	('ICICI','trivandrum'),
	('HDFC','chennai');

=========================================================
 
insert into customer(cname,city)
values('Ansaf','trivandrum'),
      ('Abhijith','trivandrum'),
      ('Bimal','chennai');

===================================================
insert into deposit(acc_no,amount,date_d)
values(1000,4000000,'2012-04-12'),
      (1010,9000000,'2012-05-14'),                (4000,2200000,'2016-10-12');


=================================================
insert into deposit(acc_no,c_id,b_id,amount,date_d)
values(1000,4000000,'2012-04-12'),
      (1010,,,9000000,'2012-05-14'),                (4000,,,2200000,'2016-10-12');



insert into borrow(loan_no ,amount,date_b)
values(1234,0,null),
	(1111,400000,'2013-03-17'),
	(2222,500000,'2015-09-19');
++++++++++++++++++++++++++++++++++++++++++++++
update deposit
set c_id=1,b_id=1
where acc_no=1000;









===================================================
function
  create or replace function cn_loan()
   returns int as
   $$
  
   begin
        select c_id,count(b_id)
        from borrow
        return count;
   end;
   $$
   language plpgsql;





