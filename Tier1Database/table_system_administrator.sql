drop table if exists system_administrator;

create table system_administrator
(
said bigint NOT NULL AUTO_INCREMENT,
account_id bigint NOT NULL,
active tinyint not null,
PRIMARY KEY (said)
);

insert into system_administrator (account_id, active) values (1, 1);
insert into system_administrator (account_id, active) values (2, 1);