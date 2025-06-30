 create database mysql28
use mysql28
create table student(regid int,sname varchar(20),age int,dob date)
select * from student 
alter table student change regid studentid int
alter table student add column place varchar(20)
insert into student(studentid,sname,age,dob,place)values
(108,"moni",23,"1999-05-06","chennai"),
(109,"susi",20,"2001-06-14","chennai"),
(110,"ashu",21,"2004-05-12","chennai")
insert into student values(111,"kavi",22,"2007-05-03",null)
update student set place="TVM" where studentid = 108 
truncate table student 
select * from student 
select studentid,sname from student 
select * from student where studentid =108
select * from student where studentid in (108,110,109)
select * from student 
select * from student where age =21 and studentid =110
select * from student where age =23 or studentid =111
select * from student where not (age =22 or studentid = 111)
select count(*) from student 
select max(age) from student
select min(age) from student
select sum(age) from student
select avg(age) from student
create database newbatch11
use  newbatch11
create table office(rollno int, sname varchar(20),age int,dob date,salary int)
alter table office change dob place varchar(20)
select * from office
insert into office(rollno,sname,age,place,salary) values 
(101,"mythu",21,"TVM",40000),
(102,"vicky",22,"chennai",50000),
(103,"kavi",23,"chennai",50000),
(104,"subi",20,"madurai",20000)
select count(*) from office
select max(place) from office
select min(place) from office
select sum(salary) from office
select avg(salary) from office
select * from office where sname like "t%"
select * from office where place like "%n%i"
select * from office where age between 20 and 25
select * from office order by salary asc
select * from office order by salary desc
select count(rollno),salary from office group by salary
select count(rollno),salary from office group by salary having count(rollno)>2
use mysql26
create table salary(sid int primary key,srange int)
create table office(regid int primary key,ename varchar(30) not null,erole varchar(20),salaryid int,foreign key(salaryid) references salary(sid))
create table officedetails(sno int primary key,regid int,ename varchar(30) not null,age int,dob date,place varchar(30),foreign key(regid) references office(regid))

insert into salary(sid,srange) values(101,10000),(102,20000),(103,30000),(104,40000),(105,50000)
select * from salary
insert into office(regid,ename,erole,salaryid)values(1,"mythu","hr",101),
(2,"akshadha","develper",102),(3,"saji","web develper",103),(4,"nivi","manager",104),(5,"athil","creater",105)
select * from office
insert into officedetails(sno,regid,ename,age,dob,place)values(01,1,"mythu",21,"2004-09-11","chennai"),
(02,2,"akshadha",22,"2004-01-11","chennai"),
(03,3,"saji",20,"2001-06-14","chennai"),
(04,4,"nivi",21,"2004-05-12","tvm"),
(05,5,"athil",23,"1999-05-06","madurai")
select * from officedetails
select a.regid,a.ename,b.age,b.place from office as a 
right join officedetails as b on a.regid = b.regid
union all
select a.regid,a.ename,b.age,b.place from office as a 
left join officedetails as b on a.regid = b.regid
create database sql12
use sql12
create table department(depid int primary key,deptname varchar(20))
insert into department(depid,deptname)values(1,"HR"),(2,"IT"),(3,"Finance"),(4,"Marketing")
select * from department
create table employee(empid int primary key,empname varchar(20),depid int)
insert into employee(empid,empname,depid)values(101,"alice",1),(102,"bob",2),(103,"charlie",2),(104,"david",3)
select * from employee
create table project(projectid int primary key ,projectname varchar(50),
empid int,foreign key (empid) references employee(empid))
insert into project(projectid,projectname,empid,employee)values((201,"alpha",101),(202,"beta",102),
(203,"gamma",103),(204,"delta",104))