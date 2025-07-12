CREATE DATABASE CRM_System;
use CRM_System;
create table create table customers(customerid int primary key ,name varchar(100) not null,
email varchar(100),phone varchar(20),address varchar(200))
insert into customers(customerid,name,email,phone,address)values(101,"mythili","mythu@gmail.com","1011-8693","vm st,tvm"),
(102,"vignesh","vm@gmail.com","1711-1011","myvi st,tvm"),
(103,"kavi","kavi@gmail.com","8110-9637","123 main rd,tvm"),
(104,"nirmal","nimi@gmail.com","9751-2134","selvan st,tvm"),
(105,"selvan","selva@gmail.com","9442-8096","pillai st,tvm"),
(106,"priya","pri@gmail.com","8637-4911","venila st,tvm")
select * from customers
create table leads(leadid int primary key, customerid int,source varchar(50),status varchar(30),
foreign key (customerid) references customers(customerid))
insert into leads (leadid,customerid,source,status)values
(1,101,"website","new"),
(2,102,"referral","contacted"),
(3,103,"advertisement","qualified"),
(4,104,"email campaign","lost"),
(5,105,"social media","contacted"),
(6,106,"event","contacted")
select * from leads
create table salesopportunities (opportunityid int primary key,customerid int,leadid int,
amount decimal(10,2),stage varchar(30),enddate date,foreign key (customerid) references customers(customerid),
foreign key (leadid)references leads(leadid)) 
insert into salesopportunities (opportunityid,customerid,leadid,amount,stage,enddate)values
(01,101,1,15000.00,"proposal","2022-07-25"),(02,102,2,25000.00,"negotiation","2013-08-15"),
(03,103,3,10000.00,"propecting","2013-08-11"),(04,104,4,12000.00,"closed won","2024-06-05"),
(05,105,5,22000.00,"proposal","2023-05-04"),(06,106,6,15000.00,"closed lost","2023-08-15")
select * from salesopportunities
create table supporttickets(ticketid int primary key,customerid int,issuedescription varchar(200),
status varchar(30),foreign key (customerid) references customers(customerid))
insert into supporttickets(ticketid,customerid,issuedescription,status)values
(11,101,"error 502 when logging in","new"),
(12,102,"payment failure","contacted"),
(13,103,"account upgrade request","qualified"),
(14,104,"security settings not applying correctly","lost"),
(15,105,"importing contacts duplicates records","contacted"),
(16,106,"permissions issue for temporary user","contacted")
select * from supporttickets
create table campaigns(campaignid int primary key,name varchar(100),
startdate date,enddate date,budget decimal(10,2))
insert into campaigns (campaignid,name,startdate,enddate,budget)values
(201,"summer sale","2020_12_01","2022-07-25",15000.00),
(202,"holiday promotion","2010-04-14","2013-08-15",25000.00),
(203,"spring launch","2011_07-12","2013-08-11",18000.00),
(204,"black friday blitz","2022-02-15","2024-06-05",3000.00),
(205,"new year campaign","2020-10-24","2023-05-04",22000.00),
(206,"clearance event","2019-12-05","2023-08-15",10000.00)
select * from campaigns
select t.ticketid,c.name as customername,t.issuedescription,t.status
from supporttickets t
join 
customers c on t.customerid = c.customerid where t.status <> "closed"
select stage, sum(amount) as totalamount from salesopportunities
group by stage 

   