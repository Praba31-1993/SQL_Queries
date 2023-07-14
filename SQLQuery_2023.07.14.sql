create table company
(
twid int identity(1,1) primary key,
tname varchar(255)
)


create table projects
(
pid int identity(1,1) primary key,
pname varchar(100),
pdomain varchar(100),
pclient_name varchar(100),
ppm_name varchar(100),
twid int,
foreign key(twid) references company(twid)
)

insert into company values('twilight')

insert into projects values('kewye', 'Real-Estate','Arokiya', 'Lara', 1)

select * from company
select * from projects

create table team_leader
(
tlid int identity(1,1) primary key,
tlname varchar(100),
tldob datetime,
tladdress varchar(100),
project_count int,
tlemail varchar(100),
tcount int,
twid int,
foreign key(twid) references company(twid)
)

insert into team_leader values('Ravi', 2023-10-10,'Pondy', 3,'ravi@gmail.com', 5, 1)



CREATE TABLE team_members (
  tmid INT IDENTITY(1, 1) PRIMARY KEY,
  tmName VARCHAR(100),
  tmDOB DATETIME,
  tmaddress VARCHAR(100),
  pid INT,
  twid INT,
  tmemail VARCHAR(100),
  tmrole VARCHAR(100), 
  tlid INT,
  FOREIGN KEY (tlid) REFERENCES team_leader(tlid),
  FOREIGN KEY (twid) REFERENCES company(twid)
);

insert into team_members values('Lekha', 2023-10-15,'Pondy', 1,1,'lekha@gmail.com','Frontend', 1)

/* Joint Query */

Select team_members.tmName,team_members.tmemail, team_members.tmrole,team_leader.tlname,projects.pname, projects.pdomain, projects.pclient_name, projects.ppm_name, company.tname
from team_members
join team_leader
ON team_leader.tlid = team_members.tlid
join projects
ON team_members.twid = projects.twid
join company
ON team_members.twid = company.twid


Select team_members.tmName,team_members.tmemail, team_members.tmrole,team_leader.tlname,projects.pname, projects.pdomain, projects.pclient_name, projects.ppm_name, company.tname
from team_members
left join team_leader
ON team_leader.tlid = team_members.tlid
left join projects
ON team_members.twid = projects.twid
left join company
ON team_members.twid = company.twid


Select * from company
Select * from team_members
Select * from team_leader
Select * from projects

CREATE PROCEDURE InsertTeamMember(@name varchar(100), @dob datetime,@address varchar(100), @pid int, @twid int, @email varchar(200), @role varchar(255),@tlid int)
AS
BEGIN
insert into team_members Values (@name,@dob,@address,@pid,@twid,@email,@role, @tlid)
END


CREATE PROCEDURE InsertTeamLeader(@name varchar(100), @dob datetime,@address varchar(100), @pcount int, @email varchar(100), @tcount int,@twid int)
AS
BEGIN
insert into team_leader Values (@name,@dob,@address,@pcount,@email,@tcount,@twid)
END


