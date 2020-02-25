drop table if exists ORDERBOOK;
drop table if exists BOOK;
drop table if exists CUSTOMER;

create table BOOK (isbn varchar(12),
title varchar(50) not null,
author varchar(50) not null ,
qty_in_stack int(10) not null,
price decimal(6,2) not null,
pubyear int(4) not null,
constraint
primary key(isbn))ENGINE=INNODB;

create table CUSTOMER (cid varchar(6),
cname varchar(20) not null,
address varchar(50),
age int(2),
constraint
primary key(cid))ENGINE=INNODB;

create table ORDERBOOK (oisbn varchar(12),
ocid varchar(6),
qty int(10) not null,
order_date date,
foreign key(oisbn)references BOOK(isbn) on delete cascade,
foreign key(ocid)references CUSTOMER(cid) on delete cascade)ENGINE=INNODB;


-- Books
INSERT INTO BOOK VALUES ("A1234", 
"Data Structures and Algorithms",
"Cormen",
5,
350.00,
2007);

INSERT INTO BOOK VALUES ("A1235", 
"Computer Networks",
"Stallings",
7,
500.00,
2003);

INSERT INTO BOOK VALUES ("A1236", 
"Operating Systems",
"Stallings",
3,
800.00,
2000);

INSERT INTO BOOK VALUES ("A1237", 
"C",
"Koffman",
10,
255.00,
2009);

INSERT INTO BOOK VALUES ("A1238", 
"Applied Mathematics",
"Chandler",
20,
300.00,
1995);

-- Customers

INSERT INTO CUSTOMER VALUES (
"c1", 
"Amar",
"23 M.G. road Ahmadabad",
20
);

INSERT INTO CUSTOMER VALUES (
"c2", 
"Akbar",
"D-20, Sainivas, Mumbai",
19
);

INSERT INTO CUSTOMER VALUES (
"c3", 
"Pooja",
"sector no. 23, Vashi, Mumbai",
24
);

INSERT INTO CUSTOMER VALUES (
"c4", 
"Saloni",
"Hyderabad",
22
);

INSERT INTO CUSTOMER VALUES (
"c5", 
"John",
"Pune, Shivajinagar",
18
);

-- Orderbook

INSERT INTO ORDERBOOK VALUES (
"A1234", 
"c2",
2,
"2013-10-01"
);

INSERT INTO ORDERBOOK VALUES (
"A1234", 
"c1",
21
"2012-07-02"
);

INSERT INTO ORDERBOOK VALUES (
"A1236", 
"c3",
2,
"2013-12-12"
);

INSERT INTO ORDERBOOK VALUES (
"A1236", 
"c5",
4,
"2012-12-30"
);

INSERT INTO ORDERBOOK VALUES (
"A1236", 
"c1",
5,
"2012-05-14"
);

INSERT INTO ORDERBOOK VALUES (
"A1238", 
"c4",
10,
"2012-06-15"
);

delete from ORDERBOOK where ocid = "c5";
delete from BOOK where isbn = "A1234";

alter table ORDERBOOK drop foreign key orderbook_ibfk_1, orderbook_ibfk_2;

alter table ORDERBOOK
	add constraint ib_1 foreign key
	(oisbn)
	references BOOK(isbn)
	on delete cascade
	on update cascade;	

alter table ORDERBOOK
	add constraint ib_2 foreign key
	(ocid)
	references CUSTOMER(cid)
	on delete cascade
	on update cascade;	

update BOOK set isbn = "A1239" where isbn ="A1238";


