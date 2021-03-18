drop table results;
drop table cast_vote;
drop table candidate;
drop table voter;

/*Creation of Tables*/
create table voter(
    voter_id number(8),
    full_name varchar(20) not null,
    gender varchar(7),
    seat_no number(5),
    age number(3) check (age>=18),
    primary key (voter_id)
);

create table candidate(
    can_id number(8),
    name varchar(256),
    age number(3) check (age>=18),
    gender varchar(7),
    aff_party varchar(256),
    seat_no number(5),
    seat_name varchar(256),
    net_income number(8),
    primary key(can_id)
);

create table cast_vote(
    vote_no number(15) not null,
    voter_id number(8) not null unique,
    can_id number(8),
    primary key(vote_no),
    foreign key (voter_id) references voter(voter_id),
    foreign key(can_id) references candidate(can_id)
);

create table results (
    can_id number(10) primary key,
    total_vote number(10),
    foreign key (can_id) references candidate(can_id)
    );

/*altering results*/
alter table results
add column poll_date date;    

/*View created Tables*/
describe voter;
describe candidate;
describe cast_vote;

/*insert data*/

insert into candidate values (100101,'Md Shoriful Islam',42,'Male','Awami League',1,'Dhaka-1',20000);
insert into candidate values (100102,'Md Insan Alam',49,'Male','BNP',1,'Dhaka-1',29000);
insert into candidate values (100103,'Md Azizur Rahman',42,'Male','Jatyio Party',2,'Dhaka-2',40000);
insert into candidate values (100104,'Raisa Alam',39,'Female','Awami League',2,'Dhaka-2',20000);
insert into candidate values (100105,'Md Anisul Islam',59,'Male','Self',2,'Dhaka-2',80000);
insert into candidate values (100106,'Sadar Khan',53,'Male','Awami League',9,'Kustia-4',70000);
insert into candidate values (100107,'Liton Chowdhury',49,'Male','BNP',9,'Kustia-4',54000);
insert into candidate values (100108,'Razia Khatun',61,'Female','Awami League',18,'Patuakhali-2',71000);
insert into candidate values (100109,'Arifur Rahman',47,'Male','BNP',18,'Patuakhali-2',66000);
insert into candidate values (100110,'Aysha Siddika',42,'Female','Jatyio Party',33,'Sylhet-1',77000);
insert into candidate values (100111,'Sultana Tarun',49,'Female','Awami League',33,'Sylhet-1',88000);
insert into candidate values (100112,'Kashem Ali',40,'Male','Jatyio Party',13,'Gopalganj-2',99000);
insert into candidate values (100113,'Nazimuddin',41,'Male','BNP',13,'Gopalganj-2',68000);
insert into candidate values (100114,'Sheikh Hasina',62,'Female','Awami League',13,'Gopalganj-2',35000);
insert into candidate values (100115,'Tanvir Islam',41,'Male','Awami League',16,'Dhaka-16',48000);
insert into candidate values (100116,'Hasanul Haque Inu',65,'Male','Self',16,'Dhaka-16',42000);
insert into candidate values (100117,'Andaliv Rahman Parthwa',38,'Male','BNP',16,'Dhaka-16',54000);
insert into candidate values (100118,'Rafiul Islam',48,'Male','Jatyio Party',17,'Barisal-2',67000);
insert into candidate values (100119,'Mir Mostafa Kamal',52,'Male','Awami League',17,'Barisal-2',34000);
insert into candidate values (100120,'Anisul Islam',61,'Male','Awami League',67,'Bagura-2',89000);
insert into candidate values (100121,'Shamuszzaman Dudu',70,'Male','BNP',67,'Bagura-2',56000);
insert into candidate values (100122,'Imrul Kayes',34,'Male','Awami League',10,'Dhaka-10',48000);
insert into candidate values (100123,'Ramkrishna Barman',71,'Male','Self',10,'Dhaka-10',43000);
insert into candidate values (100124,'Sultana Kamal',48,'Female','BNP',80,'Rangpur-4',90000);
insert into candidate values (100125,'Shaeen Khan',54,'Male','Jatyio Party',80,'Rangpur-4',99000);
insert into candidate values (100126,'Kader Siddiki',71,'Male','Self',65,'Chittagong-3',67000);
insert into candidate values (100127,'Nayem Islam',52,'Male','Islami Oikkojot',65,'Chittagang-3',54000);
insert into candidate values (100128,'Tirtho Borua',65,'Male','Awami League',65,'Chittagang-3',71000);
insert into candidate values (100129,'Rayhan Rahman',39,'Male','Self',99,'Feni-1',67000);
insert into candidate values (100130,'Ashikuzzaman Menon',69,'Male','Bangladesh Communist Party',101,'Magura-2',71000);
insert into candidate values (100131,'Sufiya Kamal',33,'Female','Awami League',101,'Magura-2',55000);
insert into candidate values (100132,'Mostafa Jamal',61,'Male','BNP',99,'Feni-1',30000);
insert into candidate values (100133,'Azizur Rahman',41,'Male','Islami Oikkojot',131,'Bhola-3',60000);
insert into candidate values (100134,'Munnuzahan',68,'Female','Awami League',44,'Khulna-4',49000);
insert into candidate values (100135,'Rasel Haque',43,'Male','BNP',44,'Khulna-4',40800);
insert into candidate values (100136,'Iftikhar Alam',51,'Male','Self',131,'Bhola-3',50000);
insert into candidate values (100137,'Azizul Kayes',64,'Male','Awami League',88,'Madaripur-1',50000);
insert into candidate values (100138,'Sheikh Burhanuddin',62,'Male','Self',88,'Madaripur-1',47000);
insert into candidate values (100139,'Tahsin Khan',55,'Male','BNP',79,'Rangpur-2',40500);

/*Using Aggregate Functions to show total number of Parties running for election*/

SELECT aff_party , count(*)
From candidate
group by aff_party;

/*List of Unique Polling seats*/
select distinct seat_no,seat_name
from candidate
order by seat_no,seat_name;

/*insert into voters*/

insert into voter values (200100,'Ariful Islam','Male',1,23);
insert into voter values (200101,'Zaima Zarnaz','Female',1,27);
insert into voter values (200102,'Ziaul Hassan','Male',1,29);
insert into voter values (200103,'Sayma Sultana','Female',1,33);
insert into voter values (200104,'Tahmid Rehman','Male',1,64);
insert into voter values (200105,'Kamrunnesa','Female',1,99);
insert into voter values (200106,'Rayhan Islam','Male',1,23);
insert into voter values (200107,'Wahan Islam','Male',1,25);
insert into voter values (200108,'Rasia Bhuyian','Female',65,27);
insert into voter values (200109,'Tapash Basshya','Male',65,33);
insert into voter values (200110,'Kazi Arif','Male',65,53);
insert into voter values (200111,'Naharunnesa','Female',1,63);
insert into voter values (200112,'Dudu mia','Male',1,43);
insert into voter values (200113,'Shamsuddin','Male',1,63);
insert into voter values (200114,'Nafisa Hasan','Female',1,73);
insert into voter values (200115,'Khokon','Male',1,29);
insert into voter values (200116,'Maliha Mimshe','Female',1,67);
insert into voter values (200117,'Muzibur Rahman','Male',1,26);
insert into voter values (200118,'Maisha Binte Farooq','Female',1,45);
insert into voter values (200119,'Golam Rabbi','Male',2,25);
insert into voter values (200120,'Rubel Islam','Male',2,28);
insert into voter values (200121,'Saima Afroz Nidhy','Female',2,33);
insert into voter values (200122,'Rezaul Islam','Male',2,47);
insert into voter values (200123,'Sumaiya Niha','Female',2,58);
insert into voter values (200124,'Rasel Islam','Male',2,57);
insert into voter values (200125,'Amina Haque','Female',2,61);
insert into voter values (200126,'Fakhar Zaman','Male',9,23);
insert into voter values (200127,'Upoma Tanha','Female',9,67);
insert into voter values (200128,'Sabbir Rumman','Male',9,66);
insert into voter values (200129,'Arpita Paul','Female',9,71);
insert into voter values (200130,'Ariful Khalek','Male',9,23);
insert into voter values (200131,'Pushpita Sarker','Female',9,45);
insert into voter values (200132,'Minhaz abedin','Male',9,56);
insert into voter values (200133,'Ariful Islam','Male',9,29);
insert into voter values (200134,'Kaba Rahman','Female',9,37);
insert into voter values (200135,'Noyon Bisshash','Male',9,23);
insert into voter values (200136,'Nahiyan','Female',9,26);
insert into voter values (200137,'Noyon Podder','Male',88,23);
insert into voter values (200138,'Tonu Das','Female',88,29);
insert into voter values (200139,'Pocha Bisshash','Male',88,20);
insert into voter values (200140,'Rahim Khan','Male',88,24);
insert into voter values (200141,'Rasel Khan','Male',88,30);
insert into voter values (200142,'Malek Munshi','Male',88,31);
insert into voter values (200143,'Rabeya Islam','Female',88,32);
insert into voter values (200144,'Shamim Choudhury','Male',88,34);
insert into voter values (200145,'Insanur Rahman','Male',88,35);
insert into voter values (200146,'Ayesha Siddika','Female',88,36);
insert into voter values (200147,'Arisha Afreen','Female',88,39);
insert into voter values (200148,'Imam ul Haq','Male',88,33);
insert into voter values (200149,'Samariya Nawrin','Female',88,23);
insert into voter values (200150,'Pasha Das','Male',88,23);
insert into voter values (200151,'Tanha Tushi','Female',101,23);
insert into voter values (200152,'Qader Ali','Male',101,27);
insert into voter values (200153,'Alim ud deen','Male',101,28);
insert into voter values (200154,'Munshi Tahmid','Male',101,23);
insert into voter values (200155,'Dipannita','Female',131,20);
insert into voter values (200156,'Kaniz Fatema','Female',131,73);
insert into voter values (200157,'Farzana Haque','Female',131,75);
insert into voter values (200158,'Sara Binte Hafiz','Female',79,46);
insert into voter values (200159,'Srabony Firdaous','Female',79,76);
insert into voter values (200160,'Borhanuddin sheikh','Male',79,45);
insert into voter values (200161,'Saifudddin','Male',79,75);
insert into voter values (200162,'Halamul Khan','Male',44,75);
insert into voter values (200163,'Tonmoy Khan','Male',44,47);
insert into voter values (200164,'Pasha Sheikh','Male',44,46);
insert into voter values (200165,'Shakil Siraz','Male',44,39);
insert into voter values (200166,'Azizur Rahman','Male',44,37);
insert into voter values (200167,'Rubaiyat Islam','Male',44,36);
insert into voter values (200168,'Saleh Islam','Male',10,35);
insert into voter values (200169,'Shakil Islam','Male',10,34);
insert into voter values (200170,'Akib Islam','Male',10,33);
insert into voter values (200171,'Azez Islam','Male',10,51);
insert into voter values (200172,'Abdul Hay Islam','Male',10,71);
insert into voter values (200173,'Baabajebon','Male',10,63);
insert into voter values (200174,'Akif Khan','Male',67,19);
insert into voter values (200175,'Akiluddin','Male',67,20);
insert into voter values (200176,'Kabir Ali','Male',67,27);
insert into voter values (200177,'Yasin Arafat','Male',67,23);
insert into voter values (200178,'Aalif Haq','Male',99,23);
insert into voter values (200179,'Shuvo Shaheb','Male',99,18);
insert into voter values (200180,'Kawsar Alam','Male',99,74);
insert into voter values (200181,'Akuluddin','Male',99,57);
insert into voter values (200182,'Mehedi Islam','Male',99,59);
insert into voter values (200183,'Khalid Rahman','Male',99,53);
insert into voter values (200184,'Dip Mukharjee','Male',99,61);
insert into voter values (200185,'Muhtasim Sowad','Male',99,64);
insert into voter values (200186,'Shamrita Paul','Male',99,64);
insert into voter values (200187,'Samrat Shanto','Male',33,19);
insert into voter values (200188,'Sajal Shovon','Male',33,78);
insert into voter values (200189,'Khalid Bin Zaman','Male',33,78);
insert into voter values (200190,'Kaysar Haque','Male',33,64);
insert into voter values (200191,'Azizul Haque Molla','Male',33,75);
insert into voter values (200192,'Sadekullah','Male',33,19);
insert into voter values (200193,'Riad Rayhan','Male',33,78);
insert into voter values (200194,'Delowar Shikdar','Male',17,47);
insert into voter values (200195,'Nasir Bisshash','Male',17,47);
insert into voter values (200196,'Ayhay Okay','Male',17,45);
insert into voter values (200197,'Joshim Gomez','Male',17,23);
insert into voter values (200198,'Sourav Paul','Male',17,23);
insert into voter values (200199,'Ovishek Sen','Male',17,29);
insert into voter values (200200,'Habibul Bashar','Male',17,69);
insert into voter values (200201,'Razin Saleh','Male',17,75);
insert into voter values (200202,'Tarek Islam','Male',65,26);
insert into voter values (200203,'Aziz Islam','Male',65,56);
insert into voter values (200204,'Mehedi Islam','Male',17,74);
insert into voter values (200205,'Mehedi Hasan','Male',17,98);
insert into voter values (200206,'Mahmud Rayhan','Male',17,99);
insert into voter values (200207,'Sakib Al Hassan','Male',17,45);
insert into voter values (200208,'Farhanul Banna','Male',17,89);
insert into voter values (200209,'Anisul Farhan','Male',13,22);
insert into voter values (200210,'Sheikh Zia','Male',13,23);
insert into voter values (200211,'Kazi Zia','Male',13,42);
insert into voter values (200212,'Rayhan Rahman','Male',13,32);
insert into voter values (200213,'Tashrif Tamanna','Female',13,36);
insert into voter values (200214,'Sadek Islam','Male',13,45);
insert into voter values (200215,'Asad Islam','Male',88,88);
insert into voter values (200216,'Araf Islam','Male',13,77);
insert into voter values (200217,'Bonna Bisshash','Female',13,77);
insert into voter values (200218,'Sarika Jannat','Female',13,64);
insert into voter values (200219,'Jannat Joyita','Female',13,67);
insert into voter values (200220,'Laboni Islam','Female',13,45);
insert into voter values (200221,'Tithy Dash','Female',131,64);
insert into voter values (200222,'Pial Islam','Male',13,67);
insert into voter values (200223,'Asifur Rahman','Male',16,89);
insert into voter values (200224,'Naimul Haque','Male',16,67);
insert into voter values (200225,'Ashika Binte','Female',16,53);
insert into voter values (200226,'Asad Haq','Male',16,76);
insert into voter values (200227,'Md Anisur Rahman','Male',16,74);
insert into voter values (200228,'Hafiz Islam','Male',16,73);
insert into voter values (200229,'Babar Ali','Male',16,29);
insert into voter values (200230,'Sakib Hasan','Male',16,28);
insert into voter values (200231,'Tamim Iqbal','Male',16,67);
insert into voter values (200232,'Salman Shah','Male',16,20);
insert into voter values (200233,'Salman Khan','Male',16,19);
insert into voter values (200234,'Shahrukh Khan','Male',16,25);
insert into voter values (200235,'Ridhi Gomez','Female',16,46);
insert into voter values (200236,'Durdana Anika','Female',18,36);
insert into voter values (200237,'Ananta Jalil','Male',18,35);
insert into voter values (200238,'Kader Sheikh','Male',18,34);
insert into voter values (200239,'Murad Islam','Male',18,93);
insert into voter values (200240,'Kawsar Islam','Male',18,83);
insert into voter values (200241,'Satyajit Paul','Male',18,73);
insert into voter values (200242,'Mohidul Samad','Male',18,63);
insert into voter values (200243,'Akib Zaman','Male',18,53);
insert into voter values (200244,'Naim Zaman Abir','Male',18,43);
insert into voter values (200245,'Prapti Taposhi','Female',18,33);
insert into voter values (200246,'Tahsin Abir','Male',18,20);

insert into results values(100101,0,'23-MAY-2019');
insert into results values(100102,0,'23-MAY-2019');


/*inserting into cast_vote*/

insert into cast_vote values(1,200100,100101);
insert into cast_vote values(2,200101,100101);
insert into cast_vote values(3,200102,100101);
insert into cast_vote values(4,200246,100109);





/*Using Join and Aggregate Function to see who got how many votes*/
SELECT C.can_id,
C.name,C.aff_party,
COUNT(CV.can_id) AS total_votes
FROM candidate C
LEFT JOIN cast_vote CV on C.can_id=CV.can_id
GROUP BY C.can_id,C.name,C.aff_party;

/*Joining results and candidates table using natural join */
select name,aff_party,seat_name,total_vote
from candidate
natural join results;

/*Using Procedures to find out if the surety of the Candidate is forfieted*/

set serveroutput on;

create or replace procedure surety_forfiet(cid in number) is
   tv number;
begin
   select count(can_id) into tv
   from cast_vote
   where can_id=cid;
   
   if tv<1 then
   DBMS_OUTPUT.PUT_LINE('Surety Forefieted of the candidate');
   else
   DBMS_OUTPUT.PUT_LINE('Surety not Forefieted of the candidate');
   end if;

end;
/

Declare
begin
surety_forfiet(100101);
surety_forfiet(100102);
end;
/


/*Using Trigger to show when a vote is casted*/

create or replace Trigger vote_done
after insert
on cast_vote
Declare
begin
DBMS_OUTPUT.PUT_LINE('Vote Casted Successfully');
end;
/

CREATE OR REPLACE TRIGGER tvc
AFTER INSERT ON cast_vote
REFERENCING NEW AS newRow OLD AS oldRow
FOR EACH ROW
BEGIN
UPDATE results SET total_vote =(select max(total_vote) from results where 
can_id=:newRow.can_id)+1 where 
can_id=:newRow.can_id;
END tvc;

Declare
begin
DBMS_OUTPUT.PUT_LINE('List of voters casted vote');
end;
/

/*Sub Query to show the voters that has casted vote*/
select full_name,gender
from voter
where voter.voter_id in(select voter_id from cast_vote);

/*Set Operations to show the list of voters that are yet to vote*/

select voter_id from voter
minus
select voter_id from cast_vote;

/*Function to show the candidate's net spending on the voting*/

create or replace Function net_spending(cid in number) return number is
ss number;
begin
ss:=0;
select (net_income*25)/1000 into ss from candidate;
return ss;
end net_spending;
/ 

/*select * from results;*/








