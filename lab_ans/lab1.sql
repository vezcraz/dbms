show tables;
drop table  if exists Albums, Artists, Users; 
create table Albums(AlbumID varchar(20),
AlbumName varchar(20) not null, 
ArtistName varchar(20) not null, 
HoursStreamed int DEFAULT 0,
Label varchar(20) ,
Genre varchar(20), 
ReleaseDate date not null, 
constraint primary key(AlbumID));


create table Artists(ArtistID varchar(20),
Name varchar(20) not null, 
ActiveSince date not null,
RetirementDate date,
NumberOfFollowers int DEFAULT 0,
Nationality varchar(20),
constraint primary key(ArtistID));


create table Users(UserID varchar(20), 
UserName varchar(20) not null,
EmailID varchar(230),
MembershipCategory ENUM('P', 'F') not null ,
constraint unique(EmailID), primary key(UserID, UserName));

desc Albums;
desc Artists;
desc Users;
