--                                             TABLE - 1 (vehicle information)

create table vehicle_info (v_id numeric primary key , v_name varchar(20) not null ,
						   v_capacity numeric not null , v_type varchar(20) not null , reg_no numeric unique);

insert into vehicle_info values ( 1 , 'bus_001' , 80 , 'bus' , 101);
insert into vehicle_info values ( 2 , 'bus_002' , 50 , 'bus' , 102);
insert into vehicle_info values ( 3 , 'bus_003' , 40 , 'bus' , 103);
insert into vehicle_info values ( 4 , 'car_001' , 3 , 'car' , 201);
insert into vehicle_info values ( 5 , 'car_002' , 6 , 'car' , 202);
insert into vehicle_info values ( 6 , 'car_003' , 5 , 'car' , 203);
select * from vehicle_info;


--                                             TABLE - 2 (employee information)

create table employee_info (e_id numeric primary key , e_name varchar(20) not null ,
						   e_mobile numeric not null , e_address varchar(20) not null , e_join_date date not null );
						   
insert into employee_info values ( 4001 , 'aarju' , 3565135510 , 'bhanvad' , '2017-10-10');
insert into employee_info values ( 4002 , 'denish' , 5465134351 , 'rupamora' , '2016-10-11');
insert into employee_info values ( 4003 , 'sagar' , 5823415245 , 'rajkot' , '2015-10-11');
insert into employee_info values ( 4004 , 'abc' , 8966224488 , 'dwarka' , '2014-10-01');
insert into employee_info values ( 4005 , 'xyz' , 4025138602 , 'bhanvad' , '2018-10-15');
insert into employee_info values ( 4006 , 'vihar' , 8758693202 , 'bihar' , '2020-10-05');
select * from employee_info;


--                                             TABLE - 3 (passengers information)


create table passengers_info (p_id numeric primary key , p_name varchar(20) not null ,
						   p_mobile numeric not null , p_address varchar(20) not null , p_age numeric not null );
						   
insert into passengers_info values ( 5001 , 'sk' , 7894562255 , 'morjar' , '20');
insert into passengers_info values ( 5002 , 'ap' , 7894562563 , 'jamnagar' , '22');
insert into passengers_info values ( 5003 , 'dn' , 8964562255 , 'rupamora' , '19');
insert into passengers_info values ( 5004 , 'sk1' , 7894542255 , 'surat' , '25');
insert into passengers_info values ( 5005 , 'ap1' , 7894552255 , 'delhi' , '50');
insert into passengers_info values ( 5006 , 'dn1' , 7894552415 , 'rajkot' , '40');
insert into passengers_info values ( 5007 , 'ab' , 7894552485 , 'valsad' , '40');
insert into passengers_info values ( 5008 , 'ab1' , 7894552885 , 'dwarka' , '19');
select * from passengers_info;


--                                             TABLE - 4 (routes information)


create table routes_info (r_id numeric primary key , start_point varchar(20) not null , destination varchar(20) not null ,
						   s_date date not null , e_date date not null );
						   
insert into routes_info values ( 6001 , 'bhanvad' , 'rajkot' ,'2021-10-27' , '2021-10-28');
insert into routes_info values ( 6002 , 'bhanvad' , 'jamnagar' ,'2021-10-29' , '2021-11-02');
insert into routes_info values ( 6003 , 'bhanvad' , 'surat' ,'2021-11-22' , '2021-11-25');
insert into routes_info values ( 6004 , 'rajkot' , 'bhanvad' ,'2021-11-27' , '2021-12-01');
insert into routes_info values ( 6005 , 'jamnagar' , 'bhanvad' ,'2021-11-17' , '2021-11-20');
insert into routes_info values ( 6006 , 'surat' , 'bhanvad' ,'2021-12-11' , '2021-12-15');
select * from routes_info;


--                                             TABLE - 5 (payment information)


create table payment_info (p_id numeric , r_id numeric , pay_date date not null , total_distance numeric not null ,
						   amount numeric not null , pay_status varchar(1) not null);
						   
ALTER TABLE payment_info ADD CONSTRAINT fk_payment FOREIGN KEY (p_id) REFERENCES passengers_info (p_id);
ALTER TABLE payment_info ADD CONSTRAINT fk_routes FOREIGN KEY (r_id) REFERENCES routes_info (r_id);	

insert into payment_info values ( 5001 , 6002 , '2021-10-27' , 167 , 500 , 's');
insert into payment_info values ( 5002 , 6003 , '2021-10-26' , 65 , 400 , 's');
insert into payment_info values ( 5003 , 6001 , '2021-10-30' , 467 , 1500 , 's');
insert into payment_info values ( 5004 , 6005 , '2021-10-14' , 167 , 500 , 's');
insert into payment_info values ( 5005 , 6002 , '2021-10-20' , 65 , 400 , 's');
insert into payment_info values ( 5007 , 6003 , '2021-10-24' , 65 , 400 , 's');
insert into payment_info values ( 5008 , 6005 , '2021-10-10' , 167 , 500 , 's');
insert into payment_info values ( 5006 , 6002 , '2021-10-31' , 467 , 1500 , 'f');
select * from payment_info;


--                                             TABLE - 6 (booking information)


create table booking (p_id numeric , v_id numeric , r_id numeric , book_date date not null );

ALTER TABLE booking ADD CONSTRAINT fk_pass FOREIGN KEY (p_id) REFERENCES passengers_info (p_id);
ALTER TABLE booking ADD CONSTRAINT fk_vehicle FOREIGN KEY (v_id) REFERENCES vehicle_info (v_id);
ALTER TABLE booking ADD CONSTRAINT fk_route1 FOREIGN KEY (r_id) REFERENCES routes_info (r_id);


insert into booking values ( 5001 , 1 , 6002 ,'2021-10-27');
insert into booking values ( 5002 , 2 , 6003 ,'2021-10-25');
insert into booking values ( 5003 , 4 , 6001 ,'2021-10-20');
insert into booking values ( 5004 , 5 , 6005 ,'2021-10-12');
insert into booking values ( 5005 , 6 , 6002 ,'2021-08-10');
insert into booking values ( 5006 , 5 , 6006 ,'2021-11-05');
select * from booking;


--                                             TABLE - 7 (driven_by)


create table driven_by (e_id numeric , v_id numeric , r_id numeric , drive_date date not null );

ALTER TABLE driven_by ADD CONSTRAINT fk_emp FOREIGN KEY (e_id) REFERENCES employee_info (e_id);
ALTER TABLE driven_by ADD CONSTRAINT fk_vehicle1 FOREIGN KEY (v_id) REFERENCES vehicle_info (v_id);						   
ALTER TABLE driven_by ADD CONSTRAINT fk_route2 FOREIGN KEY (r_id) REFERENCES routes_info (r_id);

insert into driven_by values ( 4001 , 1 , 6002 ,'2021-10-27');
insert into driven_by values ( 4002 , 2 , 6003 ,'2021-10-26');
insert into driven_by values ( 4003 , 4 , 6001 ,'2021-10-30');
insert into driven_by values ( 4005 , 5 , 6005 ,'2021-10-14');
insert into driven_by values ( 4006 , 6 , 6002 ,'2021-10-20');
insert into driven_by values ( 4004 , 5 , 6006 ,'2021-10-31');
select * from driven_by;
					   
					   
					   
					   
-- Query_1

select p_name , passengers_info.p_id from passengers_info inner join payment_info 
                               on passengers_info.p_id = payment_info.p_id where pay_status = 'f';
							   


-- Query_2

select p_name , passengers_info.p_id from passengers_info inner join (  payment_info inner join routes_info
                               on payment_info.r_id = routes_info.r_id  ) on passengers_info.p_id = payment_info.p_id
							   where payment_info.r_id = 6003 ;


-- Query_3

select count(p_name) , p_age  from passengers_info inner join payment_info 
                               on passengers_info.p_id = payment_info.p_id where pay_status = 's' group by p_age;
							   
							   
-- Query_4
							   
select routes_info.r_id, s_date , e_date , amount from routes_info inner join payment_info 
                            on payment_info.r_id = routes_info.r_id where amount > 500 ;
							

-- Query_5
						   
select passengers_info.p_id, p_name  from passengers_info inner join booking 
                            on passengers_info.p_id = booking.p_id where book_date between '2021-10-13' and '2021-10-27';							   
							   
							   
-- Query_6
						   					   
select passengers_info.p_id, p_name  from passengers_info inner join booking 
                            on passengers_info.p_id = booking.p_id where (p_name like ('s%')) 
							and (book_date not between '2021-10-13' and '2021-10-27');								   
							   
							   
-- Query_7
	   
select employee_info.e_id, e_name , e_mobile , e_join_date from employee_info inner join driven_by 
                            on employee_info.e_id = driven_by.e_id where v_id in(1,2,3);
							

-- Query_8
							   
select count(passengers_info.p_id) from passengers_info inner join ( booking inner join  vehicle_info
																	on booking.v_id = vehicle_info.v_id )
                            on passengers_info.p_id = booking.p_id where v_type = 'car';				   
							   
							   
-- Query_9
							   
select count(passengers_info.p_id) from passengers_info where p_id in 
                                             ( select p_id from routes_info inner join payment_info 
                                              on payment_info.r_id = routes_info.r_id  
											  where start_point = 'jamnagar' and  destination = 'bhanvad');							   
							   
							   

-- Query_10
							   
create view successfull_pay as select count(passengers_info.p_id)  from passengers_info inner join payment_info
                             on  passengers_info.p_id = payment_info.p_id where total_distance > 100 group by pay_status;

select * from successfull_pay;


-- query_11

alter table passengers_info add p_dob date;


update passengers_info set P_dob ='2021-10-29' where p_id = 5001 ;
update passengers_info set P_dob ='2021-10-01' where p_id = 5002;
update passengers_info set P_dob ='2021-10-10' where p_id = 5003 ;
update passengers_info set P_dob ='2021-10-27' where p_id = 5004 ;
update passengers_info set P_dob ='2021-10-28' where p_id = 5005 ;
update passengers_info set P_dob ='2021-10-24' where p_id = 5006 ;
update passengers_info set P_dob ='2021-10-25' where p_id = 5007 ;
update passengers_info set P_dob ='2021-10-30' where p_id = 5008 ;

select * from passengers_info;

























