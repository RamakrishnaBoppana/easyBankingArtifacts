# Security Tables SQL Scripts.

create table eb_users(

user_id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(64) NOT NULL UNIQUE,
password VARCHAR(100) NOT NULL,
enabled BOOLEAN NOT NULL,
credentials_expired BOOLEAN NOT NULL,
account_locked BOOLEAN NOT NULL,
account_expired BOOLEAN NOT NULL,
create_date datetime NOT NULL,
updated_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP

);


create table eb_groups (

  group_id INT AUTO_INCREMENT PRIMARY KEY,
  group_name VARCHAR(40) NOT NULL UNIQUE

);

create table eb_group_authorities(

  group_auth_id INT AUTO_INCREMENT PRIMARY KEY,
  group_id INT NOT NULL,
  authority VARCHAR(40) NOT NULL,
  FOREIGN KEY fk_groups(group_id)
  REFERENCES eb_groups(group_id)
  ON DELETE CASCADE

);

create table eb_group_members (

  group_members_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(64) NOT NULL,
  group_id INT NOT NULL,
  FOREIGN KEY fk_groups_members(group_id)
  REFERENCES eb_groups(group_id)
  ON DELETE CASCADE

);


insert into eb_users(username,password,enabled,credentials_expired,account_locked,account_expired,create_date,updated_date) values('rama@yahoo.com','$2y$12$qVCnP71jZoAcwGGW4E0fdur6nbQyl1dHrjvtjBs387mP7ETjqKVJS',true,false,false,false,now(),now());
insert into eb_users(username,password,enabled,credentials_expired,account_locked,account_expired,create_date,updated_date) values('krishna@yahoo.com','$2y$12$BPnsUzB/ld2oPM4/R9.JNuY3iWWFzH76LYdaCSgkB.n7sKmRnbE42',true,false,false,false,now(),now());
insert into eb_users(username,password,enabled,credentials_expired,account_locked,account_expired,create_date,updated_date) values('paul@yahoo.com','$2y$12$3OUQUCo2L06VmRXERx4q7uC0kcYNghyTha/Su5iLqfvuDpUFGIlNO',true,false,false,false,now(),now());
insert into eb_users(username,password,enabled,credentials_expired,account_locked,account_expired,create_date,updated_date) values('kate@yahoo.com','$2y$12$HiS8FnNvLKVPj.hBhl9NJOBvLiSyjTB5zQifASH1fJjB7l0Wg.Rbi',true,false,false,false,now(),now());

commit;

insert into eb_groups(group_name) values('ADMIN');
insert into eb_groups(group_name) values('USER');
insert into eb_groups(group_name) values('ROOTUSER');

commit;

insert into eb_group_authorities(group_id,authority) values(1,'ROLE_ADMIN');
insert into eb_group_authorities(group_id,authority) values(1,'ROLE_USER');
insert into eb_group_authorities(group_id,authority) values(2,'ROLE_USER');
insert into eb_group_authorities(group_id,authority) values(3,'ROLE_ROOTUSER');
insert into eb_group_authorities(group_id,authority) values(3,'ROLE_USER');
insert into eb_group_authorities(group_id,authority) values(3,'ROLE_ADMIN');

commit;

insert into eb_group_members(username,group_id) values('rama@yahoo.com',2);
insert into eb_group_members(username,group_id) values('krishna@yahoo.com',3);
insert into eb_group_members(username,group_id) values('paul@yahoo.com',1);
insert into eb_group_members(username,group_id) values('kate@yahoo.com',2);

commit;

