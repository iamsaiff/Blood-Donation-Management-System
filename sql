drop table hospital_info_2;
drop table hospital_info_1;
drop table recipient_1;
drop table recipient_2;
drop table bb_manager;
drop table blood_donor_1;
drop table blood_donor_2;
drop table city;
drop table recording_staff;

//BLOODBANK DATABASE
//TABLE FOR RECORDING STAFF
CREATE TABLE Recording_Staff
( reco_ID int NOT NULL PRIMARY KEY,
  reco_Name varchar(100) NOT NULL,
  reco_phNo varchar(10)
);

//TABLE FOR CITY
CREATE TABLE City
( City_ID int NOT NULL PRIMARY KEY,
  City_name varchar(100) NOT NULL
);

//TABLE FOR BLOOD DONOR
CREATE TABLE Blood_Donor_2(
 bd_name varchar(100) NOT NULL PRIMARY KEY,
 bd_age varchar(100),
 bd_Bgroup varchar(10)
);


CREATE TABLE Blood_Donor_1
( bd_ID int NOT NULL PRIMARY KEY,
  bd_name varchar(100) NOT NULL,
 reco_ID int NOT NULL,
 City_ID int NOT NULL,
 FOREIGN KEY(reco_ID) REFERENCES Recording_Staff(reco_ID),
 FOREIGN KEY(City_ID) REFERENCES City(City_ID),
 FOREIGN KEY(bd_name) REFERENCES Blood_Donor_2(bd_name)
);

//TABLE FOR MANAGER
CREATE TABLE BB_Manager
( M_id int NOT NULL PRIMARY KEY,
 mName varchar(100) NOT NULL
);

//TABLE FOR BLOOD RECIPIENT
CREATE TABLE Recipient_2(
 reci_name varchar(100) NOT NULL PRIMARY KEY,
 reci_age varchar(10),
 reci_Brgp varchar(100),
 reci_Bqnty float);

CREATE TABLE Recipient_1
( reci_ID int NOT NULL PRIMARY kEY,
  reci_name varchar(100) NOT NULL,
  reco_ID int NOT NULL,
  City_ID int NOT NULL,
  M_id int NOT NULL,
  FOREIGN KEY(M_id) REFERENCES BB_Manager(M_id),
  FOREIGN KEY(City_ID) REFERENCES City(City_ID),
  FOREIGN KEY(reco_ID) REFERENCES Recording_Staff(reco_ID),
  FOREIGN KEY(reci_name) REFERENCES Recipient_2(reci_name)
);

//TABLE FOR HOSPITALPART1
CREATE TABLE Hospital_Info_1
( hosp_ID int NOT NULL PRIMARY KEY,
 hosp_name varchar(100) NOT NULL,
 City_ID int NOT NULL,
 M_id int NOT NULL,
 FOREIGN KEY(M_id) REFERENCES BB_Manager(M_id),
 FOREIGN KEY(City_ID) REFERENCES City(City_ID)
);

//TABLE FOR HOSPITALPART2
CREATE TABLE Hospital_Info_2
( hosp_ID int NOT NULL,
 hosp_name varchar(100) NOT NULL,
 hosp_needed_Bgrp varchar(10),
 hosp_needed_qnty int,
 primary key(hosp_ID,hosp_needed_Bgrp)
);

//INSERTING RECORDING STAFF
INSERT ALL 
into Recording_Staff VALUES(101012,'Lekha',4044846553)
into Recording_Staff VALUES(101112,'shivam',4045856553)
into Recording_Staff VALUES(101212,'Walcot',4045806553)
into Recording_Staff VALUES(101312,'jackson',4045806553)
into Recording_Staff VALUES(101412,'Silva',4045806553)
into Recording_Staff VALUES(101512,'Adrian',4045806553)
into Recording_Staff VALUES(101612,'shivam',4045806553)
into Recording_Staff VALUES(101712,'shyam',4045816553)
into Recording_Staff VALUES(101812,'Jerry',4045826553)
into Recording_Staff VALUES(101912,'Tim',4045836553)
select 1 from dual;


//INSERTING INTO CITY
INSERT ALL 
into City VALUES(1100,'Dallas')
into City VALUES(1200,'Austin')
into City VALUES(1300,'Irving')
into City VALUES(1400,'Houston')
into City VALUES(1500,'Richardson')
into City VALUES(1600,'Plano')
into City VALUES(1700,'Frisco')
into City VALUES(1800,'Arlington')
into City VALUES(1900,'San Antonio')
into City VALUES(2000,'Tyler')
select 1 from dual; 


//INSERTING INTO BLOODDONOR


INSERT ALL 
into Blood_Donor_2 VALUES('Mark',25,'O+')
into Blood_Donor_2 VALUES('Abdul',35,'A-')
into Blood_Donor_2 VALUES('Shivank',22,'AB+')
into Blood_Donor_2 VALUES('Shweta',29,'B+')
into Blood_Donor_2 VALUES('Shyam',42,'A+')
into Blood_Donor_2 VALUES('Dan',44,'AB-')
into Blood_Donor_2 VALUES('Mike',33,'B-')
into Blood_Donor_2 VALUES('Elisa',31,'O+')
into Blood_Donor_2 VALUES('Carrol',24,'AB+')
into Blood_Donor_2 VALUES('shivansh',29,'O-')
select 1 from dual;

INSERT ALL 
into Blood_Donor_1 VALUES(150011,'Mark',101412,1100)
into Blood_Donor_1 VALUES(150012,'Abdul',101412,1100)
into Blood_Donor_1 VALUES(150013,'Shivank',101212,1200)
into Blood_Donor_1 VALUES(150014,'Shweta',101212,1300)
into Blood_Donor_1 VALUES(150015,'Shyam',101212,1300)
into Blood_Donor_1 VALUES(150016,'Dan',101212,1200)
into Blood_Donor_1 VALUES(150017,'Mike',101312,1400)
into Blood_Donor_1 VALUES(150018,'Elisa',101312,1200)
into Blood_Donor_1 VALUES(150019,'Carrol',101312,1500)
into Blood_Donor_1 VALUES(150020,'shivansh',101212,1200)
select 1 from dual;


//INSERTING BLOODBANK MANAGER
INSERT ALL
into BB_Manager VALUES(101,'shivank')
into BB_Manager VALUES(102,'shwetanshu')
into BB_Manager VALUES(103,'singh')
into BB_Manager VALUES(104,'yusuf')
into BB_Manager VALUES(105,'jackson')
into BB_Manager VALUES(106,'akhil')
into BB_Manager VALUES(107,'jojo')
into BB_Manager VALUES(108,'stella')
into BB_Manager VALUES(109,'monika')
into BB_Manager VALUES(110,'himanshi')
select 1 from DUAL; 

//INSERTING RECIPIENT

INSERT ALL
into Recipient_2 VALUES('Peter',25,'B+',1.5)
into Recipient_2 VALUES('shivank',60,'A+',1)
into Recipient_2 VALUES('akhil',35,'AB+',0.5)
into Recipient_2 VALUES('Parker',66,'B+',1)
into Recipient_2 VALUES('jojo',53,'B-',1)
into Recipient_2 VALUES('Preetham',45,'O+',1.5)
into Recipient_2 VALUES('Swetha',22,'AB-',1)
into Recipient_2 VALUES('Swathi',25,'B+',2)
into Recipient_2 VALUES('Lance',30,'A+',1.5)
into Recipient_2 VALUES('Marsh',25,'AB+',3.5)
select 1 from DUAL;




INSERT ALL
into Recipient_1 VALUES(10001,'Peter',101212,1100,101)
into Recipient_1 VALUES(10002,'shivank',101312,1100,102)
into Recipient_1 VALUES(10003,'akhil',101312,1200,102)
into Recipient_1 VALUES(10004,'Parker',101212,1300,104)
into Recipient_1 VALUES(10005,'jojo',101412,1400,105)
into Recipient_1 VALUES(10006,'Preetham',101512,1500,105)
into Recipient_1 VALUES(10007,'Swetha',101212,1500,101)
into Recipient_1 VALUES(10008,'Swathi',101412,1300,103)
into Recipient_1 VALUES(10009,'Lance',101312,1100,104)
into Recipient_1 VALUES(10010,'Marsh',101212,1200,107)
select 1 from DUAL;

//INSERTING HOSPITALINFO1
INSERT ALL
into Hospital_Info_1 VALUES(1,'MayoClinic',1100,101)
into Hospital_Info_1 VALUES(2,'CleavelandClinic',1200,103)
into Hospital_Info_1 VALUES(3,'NYU',1300,103)
into Hospital_Info_1 VALUES(4,'Baylor',1400,104)
into Hospital_Info_1 VALUES(5,'Charlton',1800,103)
into Hospital_Info_1 VALUES(6,'Greenoaks',1300,106)
into Hospital_Info_1 VALUES(7,'Forestpark',1300,102)
into Hospital_Info_1 VALUES(8,'Parkland',1200,106)
into Hospital_Info_1 VALUES(9,'Pinecreek',1500,109)
into Hospital_Info_1 VALUES(10,'WalnutHill',1700,105)
select 1 from DUAL;

//INSERTING HOSPITALINFO2
INSERT ALL 
into Hospital_Info_2 VALUES(1,'MayoClinic','A+',20)
into Hospital_Info_2 VALUES(1,'MayoClinic','A-',0)
into Hospital_Info_2 VALUES(1,'MayoClinic','AB+',40)
into Hospital_Info_2 VALUES(1,'MayoClinic','AB-',10)
into Hospital_Info_2 VALUES(1,'MayoClinic','B-',20)
into Hospital_Info_2 VALUES(2,'CleavelandClinic','A+',40)
into Hospital_Info_2 VALUES(2,'CleavelandClinic','AB+',20)
into Hospital_Info_2 VALUES(2,'CleavelandClinic','A-',10)
into Hospital_Info_2 VALUES(2,'CleavelandClinic','B-',30)
into Hospital_Info_2 VALUES(2,'CleavelandClinic','B+',0)
into Hospital_Info_2 VALUES(2,'CleavelandClinic','AB-',10)
into Hospital_Info_2 VALUES(3,'NYU','A+',0)
into Hospital_Info_2 VALUES(3,'NYU','AB+',0)
into Hospital_Info_2 VALUES(3,'NYU','A-',0)
into Hospital_Info_2 VALUES(3,'NYU','B-',20)
into Hospital_Info_2 VALUES(3,'NYU','B+',10)
into Hospital_Info_2 VALUES(3,'NYU','AB-',0)
into Hospital_Info_2 VALUES(4,'Baylor','A+',10)
into Hospital_Info_2 VALUES(4,'Baylor','A-',40)
into Hospital_Info_2 VALUES(7,'Forestpark','B-',40)
into Hospital_Info_2 VALUES(8,'Parkland','B+',10)
into Hospital_Info_2 VALUES(9,'Pinecreek','AB-',20)
select 1 from DUAL;
