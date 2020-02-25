drop database if exists lab1;
create database lab1;
	connect lab1;
	use lab1;
	show tables;
	drop table  if exists Albums,Artists,Users;
	create table Albums(
		AlbumId VARCHAR(15),
		AlbumName VARCHAR(15) NOT NULL,
		ArtistName VARCHAR(15) NOT NULL,
		HoursStreamed INT DEFAULT 0,
		Label VARCHAR(15),
        Genre VARCHAR(15),
        ReleaseDate date NOT NULL,
        primary key(AlbumId)
	);

create table Artists(
		ArtistId VARCHAR(15),
		Name VARCHAR(15) NOT NULL,
		ActiveSince date NOT NULL,
		RetirementDate date,
		NumberOfFollowers INT NOT NULL,
        Nationality VARCHAR(15) NOT NULL,
        primary key(ArtistId)
	);


	create table Users(
		UserId VARCHAR(15),
	    UserName VARCHAR(15),
		EmailID VARCHAR(25) NOT NULL,
		MembershipCategory ENUM('P','F') DEFAULT 'F' NOT NULL,
		CONSTRAINT ue UNIQUE(EmailID),
        primary key(UserId,UserName)
	);	

	desc Albums;
	desc Artists;
	desc Users;

	alter table Users change MembershipCategory AccountType ENUM('P','F') DEFAULT 'F' NOT NULL;

	desc Users;
	desc Artists;
	alter table Artists drop column Nationality;

   desc Artists;

   desc Albums;

   alter table Albums modify  HoursStreamed FLOAT(10,2);

   desc Albums;

insert into Albums(AlbumID,ArtistName,AlbumName,HoursStreamed,Label,Genre,ReleaseDate)
	Values('39391', 'Linkin Park', 'A Thousand Suns', 128, 'Warner Bros', 'Rock', '2016/06/17');

insert into Albums(AlbumID,ArtistName,AlbumName,HoursStreamed,Label,Genre,ReleaseDate)
	Values('14573', 'Maroon 5', 'Overexposed', 452, 'A&M', 'Funk', '2016/11/11');

	insert into Albums(AlbumID,ArtistName,AlbumName,HoursStreamed,Label,Genre,ReleaseDate)
	Values( '24573', 'Maroon', 'Overexposed', 400, 'A&M', 'Funk', '2016/11/30');

insert into Artists(ArtistID,Name,ActiveSince,RetirementDate,NumberOfFollowers)
	Values('100', 'Maroon 5', '2007/11/13', NULL, 16000123);


insert into Artists(ArtistID,Name,ActiveSince,RetirementDate,NumberOfFollowers)
	Values( '101', 'Linkin Park', '2000/02/14', '2017/07/20', 21174672);


insert into Artists(ArtistID,Name,ActiveSince,RetirementDate,NumberOfFollowers)
	Values('102', 'Eminem', '2001/01/15', NULL, 14093412);


insert into Artists(ArtistID,Name,ActiveSince,RetirementDate,NumberOfFollowers)
	Values('103', 'Coldplay', '2002/05/13', NULL, 18000992);

insert into Users(UserID,UserName,EmailID,AccountType)
	Values('10003', 'Anurag Dwivedi', 'adwivedi@gmail.com', 'F');


insert into Users(UserID,UserName,EmailID,AccountType)
	Values( '10004', 'Sana Kothari', 'sana123@gmail.com', 'P');


insert into Users(UserID,UserName,EmailID)
	Values('10005', 'Vishal Ghosh', 'vishy@gmail.com');

-- select * from Albums;
-- select * from Artists;
-- select * from Users;

select distinct Label from Albums;
select * from Users as U where U.AccountType='P';

select AlbumName from Albums where ArtistName='Maroon 5' and Genre='Rock';

select HoursStreamed from Albums;
update Albums set HoursStreamed=HoursStreamed+200 where Genre='Rock';
select HoursStreamed from Albums;

alter table Artists add column Duration Int NOT NULL;
desc Artists;

select * from Albums;
DELETE from Albums where HoursStreamed>400;
select * from Albums;

select HoursStreamed,AlbumName from Albums;
select HoursStreamed*1.20,AlbumName from Albums;
select NumberOfFollowers from Artists where ArtistId='100';
Update Artists set NumberOfFollowers=NumberOfFollowers+200 where ArtistId='100';
select NumberOfFollowers from Artists where ArtistId='100';

select * from Artists;
update Artists set Duration=CURDATE()-ActiveSince;
select * from Artists;	

select sysdate() from dual;
 
select curdate() from dual;


select * from Albums;
select AlbumName from Albums where Genre='Rock'
union
select AlbumName from Albums where Genre='Funk';
-- ALSO A POSSIBLE ANS TO 22 LAB1
-- 
-- select ALbumName from Albums as A where A.Genre IN ('Rock','Funk');
