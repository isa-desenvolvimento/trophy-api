create database game_db_dev;
--create database game_db_test;
--create database game_db_prod;

use game_db_dev;

create table users(
    id int not null primary key auto_increment,
    name varchar(150),
    email varchar(150),
    pass varchar(150)
) row_format=dynamic engine=innodb default charset=utf8;

create table monsters(
    id int not null primary key auto_increment,
    name varchar(150)
) row_format=dynamic engine=innodb default charset=utf8;

create table collected_coins(
    id int not null primary key auto_increment,
    user_id int not null,
    value_coin int not null,
    foreign key (user_id) references users(id)
) row_format=dynamic engine=innodb default charset=utf8;

create table killed_monsters(
    id int not null primary key auto_increment,
    user_id int not null,
    monster_id int not null,
    foreign key (user_id) references users(id),
    foreign key (monster_id) references monsters(id)
) row_format=dynamic engine=innodb default charset=utf8;

create table deaths(
    id int not null primary key auto_increment,
    user_id int not null,
    time_reg timestamp not null,
    foreign key (user_id) references users(id)
) row_format=dynamic engine=innodb default charset=utf8;

create table trophies(
    id int not null primary key auto_increment,
    name varchar(45)
) row_format=dynamic engine=innodb default charset=utf8;

create table user_trophies(
    id int not null primary key auto_increment,
    user_id int not null,
    trophy_id int not null,
    foreign key (user_id) references users(id),
    foreign key (trophy_id) references trophies(id)
) row_format=dynamic engine=innodb default charset=utf8; 


-- dados default
insert into users values (1, 'mario bross', 'mario@email.com', '123');
insert into users values (2, 'sonic', 'sonic@email.com', 'abc');

insert into monsters values (1, 'turtle');
insert into monsters values (2, 'bowser');

insert into trophies values (1, 'Gold');
insert into trophies values (2, 'Silver');
insert into trophies values (3, 'Bronze');
insert into trophies values (4, 'Platinum');
insert into trophies values (5, 'Daimond');
-- fim dados default


-- dados simulando algumas inserções no banco
insert into collected_coins values (1, 1, 1);
insert into collected_coins values (2, 1, 2);
insert into collected_coins values (3, 1, 5);
insert into collected_coins values (4, 1, 2);

insert into collected_coins values (5, 2, 1);
insert into collected_coins values (6, 2, 2);
insert into collected_coins values (7, 2, 5);
insert into collected_coins values (8, 2, 2);

insert into killed_monsters values (1, 1, 1);
insert into killed_monsters values (2, 1, 2);
insert into killed_monsters values (3, 1, 1);
insert into killed_monsters values (4, 1, 2);

insert into killed_monsters values (5, 2, 1);
insert into killed_monsters values (6, 2, 2);
insert into killed_monsters values (7, 2, 2);
insert into killed_monsters values (8, 2, 2);

insert into deaths values (1, 1, sysdate());
select sleep(3);
insert into deaths values (2, 1, sysdate());
select sleep(3);
insert into deaths values (3, 2, sysdate());

insert into user_trophies values (1, 1, 1);
insert into user_trophies values (2, 2, 3);
