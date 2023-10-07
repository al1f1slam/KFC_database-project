create table Customer_Info (
serialnum number(5) ,
cr_name varchar2(30) ,
cr_age number(5),
cr_phonenum number(11),
cr_tablenum number(5)
)
alter table Customer_Info add constraint customer_serialnum_pk primary key (serialnum) 
alter table Customer_Info modify cr_tablenum number(5) not null 
alter table Customer_Info add unique(cr_phonenum)

desc Customer_Info 

create sequence serial1
start with 350
increment by 1
maxvalue 999


insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Monjurul',45,1712345678,2)
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Momtahina',40,1787654321,2)
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Mustak',10,null,2)
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Sayem',22,1300000000,7)
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Najmul',22,1700000000,7) 
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Joy',21,1800000000,7) 
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Fariha',22,1500112233,6)
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Sadia',23,1499994444,6)
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Nadia',21,1855556666,6)
insert into Customer_Info (serialnum,cr_name,cr_age,cr_phonenum,cr_tablenum) 
values(serial1.nextval,'Tanvir',28,1820202020,10)
select * from Customer_Info 
---------------------------------------------------------------------------------------------------------

create table Menu (
foodcode number(5) primary key ,
foodname varchar2(25),
price number(5),
quantity varchar2(35),
vat varchar2(10)
)

desc Menu

insert into Menu(foodcode,foodname,price,quantity,vat) values (2201,'Buddy Rice Combo',699,'2 Popcorn Rice Bowlz & 8pcs Wings','24%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2210,'Buddy Zinger Combo',749,'A large Popcorn with 2 Zingers','17%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2227,'Friendship Bucket',899,'3pcs Hot Wings,3pcs Strips','15%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2230,'Hot Wings',279,'6pcs','10%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2232,'Boneless Strips',489,'6pcs','10%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2235,'Deluxe Zinger',399,'Layer of a veggie patty and cheese','10%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2237,'Veggie Burger',279,'Topped with lettuce & mayo','15%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2239,'Popcorn Chicken',219,'Bite-sized boneless pieces','12%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2245,'Tangy Fries',160,'Large Pack','11%')
insert into Menu(foodcode,foodname,price,quantity,vat) values (2252,'Mountain Dew',20,'250ml','5%')

select * from Menu
---------------------------------------------------------------------------------------------------------------


create table Order_Info (
fdsr number(5) constraint order_fdsr_pk primary key,
serialnum number(5) constraint order_serial_fk references Customer_Info(serialnum) , 
foodcode number(5) constraint order_foodcode_fk references Menu(foodcode) 
)

desc Order_Info

insert into Order_Info(fdsr,serialnum,foodcode) values (600,350,2201)
insert into Order_Info(fdsr,serialnum,foodcode) values (601,351,2210)
insert into Order_Info(fdsr,serialnum,foodcode) values (602,352,2227)
insert into Order_Info(fdsr,serialnum,foodcode) values (603,353,2230)
insert into Order_Info(fdsr,serialnum,foodcode) values (604,354,2232)
insert into Order_Info(fdsr,serialnum,foodcode) values (605,355,2235)
insert into Order_Info(fdsr,serialnum,foodcode) values (606,356,2237)
insert into Order_Info(fdsr,serialnum,foodcode) values (607,357,2239)
insert into Order_Info(fdsr,serialnum,foodcode) values (608,358,2245)
insert into Order_Info(fdsr,serialnum,foodcode) values (609,359,2252)

select * from order_info
-----------------------------------------------------------------------------------------------------------------


create table Waiter_Info (
wr_id number(5) constraint waiter_wr_id_pk primary key,
wr_name varchar2(20), 
wr_age number(3) check (wr_age>=18), 
wr_phonenum number(11) unique,
wr_salary number(5) not null,
wr_working_exp varchar2(25),
branchid number(5) constraint waiter_branchid_fk references Branch_Info(branchid)
)

desc Waiter_Info 

insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1001','Fahim' ,'27', 1715864258,15000,'3 Years',1111)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1002','Hasan' ,'29', 1787896541,20000,'5 Years',2222)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1003','Sartaz','25', 1985621478,12000,'2 Years',3333)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1004','Ontu'  ,'32', 1965478521,22000,'7 Years',4444)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1005','Abir'  ,'25', 1756987412,12000,'1 Years',5555)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1006','Rony'  ,'24', 1818647896,12000,'6 Months',6666)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1007','Imtiaz','29', 1558745698,18000,'4 Years',7777)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1008','Prodip','23', 1785654236,12000,'3 Months',8888)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1009','Adnan' ,'30', 1865456664,20000,'5 Years',9999)
insert into Waiter_Info (wr_id,wr_name,wr_age, wr_phonenum, wr_salary,wr_working_exp,branchid) values ( '1000','Sohel' ,'26', 1874566546,12000,'1 Years',1010)

select * from Waiter_Info
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Receive_Order(
sw_id number(5),
serialnum number(5),
wr_id number(5)
)

alter table Receive_Order add constraint receive_sw_id_pk primary key(sw_id)
alter table Receive_Order add constraint receive_serialnum_fk foreign key (serialnum) references Customer_Info (serialnum)
alter table Receive_Order add constraint receive_wr_id_fk foreign key (wr_id) references Waiter_Info (wr_id)
alter table Receive_Order modify sw_id number(5) not null

desc Receive_Order

insert into Receive_Order(sw_id, Serialnum, wr_id) values(1, 350, 1001)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(2, 351, 1002)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(3, 352, 1003)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(4, 353, 1004)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(5, 354, 1005)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(6, 355, 1006)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(7, 356, 1007)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(8, 357, 1008)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(9, 358, 1009)
insert into Receive_Order(sw_id, Serialnum, wr_id) values(10,359, 1010)

select * from Receive_Order
-------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Manager_Info(
mr_id number(5) primary key,
mr_name varchar2(25),
mr_age number(3) check(mr_age>=18),
mr_educertificate varchar2(50),
mr_phonenum number(11) unique,
mr_salary number(6) not null
)

desc Manager_Info

insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5001,'Mr Sohel',36,'Bachelors in Hospitality',1889874569,35000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5002,'Mr Abir',35,'Bachelors in Management',1995456545,35000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5003,'Mr Ontu',30,'Bachelors in Hospitality',1756623456,32000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5004,'Mr Rony',30,'Bachelors in Management',1789544555,32000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5005,'Mr Apon',31,'Bachelors in Management',1885456545,30000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5006,'Mr Efty',33,'Bachelors in Hospitality',1999456545,31000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5007,'Mr Adnan',32,'Bachelors in Accounting',1335456545,28000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5008,'Mr Porosh',34,'Bachelors in Hospitality',1777456545,26000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5009,'Mr Hasan',30,'Bachelors in Accounting',1885456546,29000)
insert into Manager_Info (mr_id,mr_name,mr_age,mr_educertificate,mr_phonenum,mr_salary) 
values (5010,'Mr Fahim',28,'Bachelors in Accounting',1555456545,27000)

select * from Manager_Info
----------------------------------------------------------------------------------------------------------------------------------------------------------

create table Branch_Info (
branchid number(5),
k_phonenum number(11), 
location varchar2(50), 
licensenum number(15),
mr_id number(5) 
)

alter table Branch_Info add constraint branch_branchid_pk primary key(branchid)
alter table Branch_Info modify location varchar2(50) not null
alter table Branch_Info add constraint Branch_mr_id_fk foreign key (mr_id) references Manager_Info (mr_id)
alter table Branch_Info add unique(k_phonenum)

desc Branch_Info

insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (1111, 1818642669, 'Uttara'  ,  10101010101010, 5001)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (2222, 1985456515, 'Khilgaon',  20202020202020, 5002)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (3333, 1865456654, 'Mirpur' ,   30303030303030, 5003)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (4444, 1985665454, 'Gulshan',   40404040404040, 5004)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (5555, 1895778999, 'Banani',    50505050505050, 5005)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (6666, 1985665444, 'Paltan'  ,  60606060606060, 5006)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (7777, 1756544555, 'Panthapath',70707070707070, 5007)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (8888, 1789654556, 'Adabor',    80808080808080, 5008)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (9999, 1985665445, 'Wari',      90909090909090, 5009)
insert into Branch_Info (branchid,k_phonenum,location,licensenum,mr_id) values (1010, 1789544566, 'Savar',     10010010010010, 5010)


select * from Branch_Info
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Chef_Info(
cf_id number(5) Primary key,
cf_name varchar2(15),
cf_age number(5) check(cf_age>=18),
cf_phonenum number(11) unique,
cf_cooking_exp varchar2(30),
cf_salary number(5) not null
)

desc Chef_Info

insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3001,'Nayeem',32,1734627348, '2 years', 18000)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3002,'Shovo',38,1634627558, '1 years', 17000)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3003,'Jamil',31,1334627348, '2 years' ,18500)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3004,'Asif',37,1834627342, '5 years' ,20000)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3005,'Hasib',39,1534627339, '6 years', 22000)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3006,'Sajib',30,1734627548, '2 years' ,16500)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3007,'Raju',41,1634625632, '6 years' ,22000)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3008,'Sumon',27,176839831, '3 years', 19000)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3009,'Mamun',32,18676240, '4 years' ,20000)
insert into Chef_Info(cf_id,cf_name,cf_age,cf_phonenum,cf_cooking_exp, cf_salary) values(3010,'Hasan',24,164062728, '2 years' ,18000)

select * from Chef_Info
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Employee_Info(
wc_id number(5) ,
wr_id number(5),
cf_id number(5)
)
alter table Employee_Info add constraint employee_wc_id_pk primary key(wc_id)
alter table Employee_Info add constraint employee_wr_id_fk foreign key(wr_id) references Waiter_Info(wr_id)
alter table Employee_Info add constraint employee_cf_id_fk foreign key(cf_id) references Chef_Info(cf_id) 

Desc Employee_Info 

insert into Employee_Info(wc_id, wr_id, cf_id) values(975, 1001, 3001)
insert into Employee_Info(wc_id, wr_id, cf_id) values(976, 1002, 3002)
insert into Employee_Info(wc_id, wr_id, cf_id) values(977, 1003, 3003)
insert into Employee_Info(wc_id, wr_id, cf_id) values(978, 1004, 3004)
insert into Employee_Info(wc_id, wr_id, cf_id) values(979, 1005, 3005)
insert into Employee_Info(wc_id, wr_id, cf_id) values(980, 1006, 3006)
insert into Employee_Info(wc_id, wr_id, cf_id) values(981, 1007, 3007)
insert into Employee_Info(wc_id, wr_id, cf_id) values(982, 1008, 3008)
insert into Employee_Info(wc_id, wr_id, cf_id) values(983, 1009, 3009)
insert into Employee_Info(wc_id, wr_id, cf_id) values(984, 1000, 3010)

Select * from Employee_info


                                                     -------------------------------------------------------         THE END          ---------------------------------------------------------------



