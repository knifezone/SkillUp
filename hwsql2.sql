create database OSTROUKHOVA;

use OSTROUKHOVA;

create table USERS (
id int auto_increment primary key,
login varchar(20) not null,
`password` varchar(20) not null
);

insert into USERS value
(null, 'user1', 'pass1'),
(null, 'user2', 'pass2'),
(null, 'user3', 'pass3'),
(null, 'user4', 'pass4'),
(null, 'user5', 'pass5'),
(null, 'user6', 'pass6'),
(null, 'user7', 'pass7'),
(null, 'user8', 'pass8'),
(null, 'user9', 'pass9'),
(null, 'user10', 'pass10'),
(null, 'user11', 'pass11'),
(null, 'user12', 'pass12'),
(null, 'user13', 'pass13'),
(null, 'user14', 'pass14'),
(null, 'user15', 'pass15');

create table `PROFILES` (
id int auto_increment primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(30) null,
age int null);

insert into `PROFILES` (first_name, last_name) values
(null, 'Oliver', 'Smith'),
(null, 'Jack', 'Johnson'),
(null, 'Harry', 'Williams'),
(null, 'Jacob', 'Jones'),
(null, 'Charley', 'Brown'),
(null, 'Thomas', 'Davis'),
(null, 'George', 'Miller'),
(null, 'Oscar', 'Wilson'),
(null, 'James', 'Moore'),
(null, 'William', 'Taylor');

update `PROFILES`
	set email = 'JacobJones@gmail.com'
    where id = 4;
    
update `PROFILES`
	set email = 'HarryWilliams@gmail.com',
		age = 20
    where id = 3;

update `PROFILES`
	set email = 'WilliamTaylor@gmail.com',
		age = 19
    where id = 10;

update `PROFILES`
	set age = case
		when id = 5 then 25
        when id = 9 then 23
        when id = 7 then 33
			else age
		end;

create table GAMES (
id int auto_increment primary key,
first_player_id varchar(20) not null,
second_player_id varchar(20) not null
);

create table GAME_RESULTS (
id int auto_increment primary key,
result_value varchar(5) not null
);

insert into GAME_RESULTS values
(null, 'WIN'),
(null, 'LOSE'),
(null, 'DRAW');

create table ACHIEVEMENTS (
id int auto_increment primary key,
achiev_name varchar(20) not null
);

insert into ACHIEVEMENTS values
(null, 'Newbie'),
(null, 'Apprentice'),
(null, 'Adventurer'),
(null, 'Expert'),
(null, 'Master');

create table PLAYER_ACHIEVS (
id int auto_increment primary key,
player_id int not null,
achiev_id int not null
);

create table PLAYER_RESULTS (
id int auto_increment primary key,
player_id int not null,
result_id int not null,
game_id int not null
);

alter table USERS
add column profiles_id int;

alter table USERS
add constraint FK_USERS_PROFILES
foreign key (profiles_id)
references `PROFILES` (id);

alter table PLAYER_ACHIEVS
add constraint FK_PLAYER_ACHIEVS_PROFILES
foreign key (player_id)
references `PROFILES` (id);

alter table PLAYER_ACHIEVS
add constraint FK_PLAYER_ACHIEVS_ACHIEVEMENTS
foreign key (achiev_id)
references ACHIEVEMENTS (id);

alter table PLAYER_RESULTS
add constraint FK_PLAYER_RESULTS_PROFILES
foreign key (player_id)
references `PROFILES` (id);

alter table PLAYER_RESULTS
add constraint FK_PLAYER_RESULTS_GAME_RESULTS
foreign key (result_id)
references GAME_RESULTS (id);

alter table PLAYER_RESULTS
add constraint FK_PLAYER_RESULTS_GAMES
foreign key (game_id)
references GAMES (id);

alter table GAMES modify second_player_id int;
alter table GAMES modify first_player_id int;

alter table GAMES
add constraint FK_GAMES_PROFILES
foreign key (second_player_id)
references `PROFILES` (id);

alter table GAMES
add constraint FK_GAMES_PROFILES_FIRST
foreign key (first_player_id)
references `PROFILES` (id);

insert into GAMES values
(null, 1, 2),
(null, 3, 4),
(null, 5, 6),
(null, 7, 8),
(null, 9, 10),
(null, 2, 4),
(null, 6, 8),
(null, 10, 1),
(null, 3, 5),
(null, 7, 9);

insert into player_achievs values
(null, 1, 4),
(null, 1, 5),
(null, 3, 1),
(null, 3, 2),
(null, 9, 3);

insert into player_results values
(null, 5, 1, 3),
(null, 9, 1, 5),
(null, 9, 2, 10),
(null, 3, 2, 2),
(null, 5, 3, 9);

delete 
	from USERS
    where id = 2;
delete 
	from USERS
    where id = 5;
delete 
	from USERS
    where id = 7;
delete 
	from USERS
    where id = 12;
delete 
	from USERS
    where id = 15;

update `PROFILES`
	set first_name = 'Bob'	
    where id = 5;
    
update USERS
	set profiles_id = case
		when id = 1 then 10
        when id = 3 then 9
        when id = 4 then 8
        when id = 6 then 7 
        when id = 8 then 6
        when id = 9 then 5 
        when id = 10 then 4
        when id = 11 then 3
        when id = 13 then 2
        when id = 14 then 1
			else profiles_id
		end;
        
/* домашка. часть 2 */      
  
select
	u.login as "Логин",
    p.first_name as "Имя",
    p.last_name as "Фамилия"
		from USERS as u
        join `PROFILES` as p on p.id = profiles_id;
        
insert into player_achievs values
(null, 5, 5),
(null, 10, 4);

update player_achievs
	set player_id = 7	
    where id = 2;
    
update player_achievs
	set player_id = 4	
    where id = 4;
    
select
	prof.id as "Айди игорока",
	prof.first_name as "Имя игрока",
	prof.email as "Имейл",
	ach.achiev_name as "Достижения"
		from player_achievs as pach
		join `PROFILES` as prof on prof.id = pach.player_id
        join achievements as ach on ach.id = pach.achiev_id
	limit 5;

insert into player_results values
(null, 1, 1, 1),
(null, 2, 2, 1),
(null, 4, 1, 2),
(null, 6, 2, 3),
(null, 7, 2, 4),
(null, 8, 1, 4),
(null, 10, 2, 5),
(null, 2, 2, 6),
(null, 4, 1, 6),
(null, 6, 3, 7),
(null, 8, 3, 7),
(null, 10, 2, 8),
(null, 1, 1, 8),
(null, 3, 3, 9),
(null, 7, 1, 10);

select
	prof.id as "Айди игорока",
	prof.first_name as "Имя игрока",
    prof.last_name as "Фамилия игрока",
	prof.email as "Имейл",
    prof.age as "Возраст",
	gr.result_value as "Результат игры"
		from player_results as plrez, `PROFILES` as prof, game_results as gr
        where prof.id = plrez.player_id
			and gr.id = plrez.result_id
			and plrez.result_id = 1;
            
select
	us.login as "Логин",
	us.password as "Пароль",
	gm.id as "Айди игры"
		from games as gm 
        join `PROFILES` as prof on prof.id = gm.first_player_id
        join users as us on prof.id = us.profiles_id;
        
select
	prof.first_name as "Имя",
    count(*) as count_of_games
		from games as gm 
        join `PROFILES` as prof on prof.id = gm.second_player_id
        group by prof.first_name
        order by count_of_games desc;

select
	prof.first_name as "Имя",
    prof.email as "Имейл"
		from `PROFILES` as prof 
        where prof.id in (select first_player_id
							from games);
      