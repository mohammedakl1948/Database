create database CSC426project;


use CSC426project;

create table services 
(
servicenumber int not null,
gym varchar(50) not null,
internet varchar(100) ,
spa varchar(50) ,
products varchar(50) ,
primary key(servicenumber)
);

create table beachbool 
(
id int not null,
chairnumber int ,
tablenumber varchar(100) ,
jetskirental varchar(50) ,
servicenumber int ,
primary key(id),
foreign key (servicenumber) references services(servicenumber)
);

create table restaurant 
(
foodid int not null,
drinks varchar(50) ,
shisha varchar(50),
servicenumber int ,
primary key(foodid),
foreign key (servicenumber) references services(servicenumber)
);

create table maintenance 
(
weaklycheckupnum int not null,
electronics varchar(50),
servicenumber int ,
foreign key (servicenumber) references services(servicenumber)
);

create table rooms 
(
roomtypeid int not null,
number int ,
location varchar(50),
rview varchar(50),
servicenumber int ,
primary key(roomtypeid),
foreign key (servicenumber) references services(servicenumber)
);

create table hotel 
(
code int not null,
HotelName varchar(50) not null,
haddress varchar(100) ,
phonenum varchar(50) ,
servicenumber int ,
primary key(code),
foreign key (servicenumber) references services(servicenumber)
);

use CSC426project;
create table taxi
(
driverid int not null,
cartype varchar(50),
size int ,
loation varchar(50),
code int ,
primary key(driverid),
foreign key (code) references hotel(code)
);

use CSC426project;
create table employee 
(
ssn int not null,
firstname varchar(50) not null,
lastname varchar(100) not null,
salary varchar(50) ,
dateofbirth varchar(50) ,
age int ,
Did int ,
primary key(ssn),
foreign key (Did) references taxi(driverid)
);

use CSC426project;
create table events
(
eventnumber int ,
date varchar(50),
numberofpeople int ,
services varchar(50) ,
primary key(eventnumber)
);

use CSC426project;
create table customer
(
customerid int not null,
fullname varchar(50),
birthdate varchar(50),
sex varchar(50),
nationality varchar(50),
eventno int ,
primary key(customerid),
foreign key(eventno) references events(eventnumber)
);
use CSC426project;
create table meetcust
(
custid int ,
meetname varchar(50),
foreign key(custid) references customer(customerid),
foreign key(meetname) references meetings(meetroomname)
);
use CSC426project;
create table meetings
(
meetroomname varchar(50) not null,
numberofpeople int ,
primary key(meetroomname)
);

use CSC426project;
create table bills
(
fees int ,
services varchar(50),
custid int ,
foreign key(custid) references customer(customerid)
);

use CSC426project;
create table reservation
(
bookingid int not null,
dateandtime varchar(50) , 
numberofpeople int,
sheckin_checkout varchar(20),
essn int ,
primary key(bookingid),
foreign key(essn) references employee(ssn)
);

use CSC426project;
create table message
(
codeofmess int not null,
sender varchar(50),
recepiet varchar(50),
dateandtime varchar(50),
bookingid int ,
primary key(codeofmess),
foreign key(bookingid) references reservation(bookingid)
);

use CSC426project;
create table hotelemp
(
code int ,
ssn int ,
foreign key(code) references hotel(code),
foreign key(ssn) references employee(ssn)
);


use CSC426project;
create table custemp
(
custid int ,
ssn int ,
foreign key(custid) references customer(customerid),
foreign key(ssn) references employee(ssn)
);

use CSC426project;
create table drivercust
(
custid int ,
did int ,
foreign key(custid) references customer(customerid),
foreign key(did) references taxi(driverid)
);

use CSC426project;
create table reservcust
(
bookingid int ,
custid int ,
foreign key(custid) references customer(customerid),
foreign key(bookingid) references reservation(bookingid)
);

