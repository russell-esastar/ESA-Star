drop database if exists security;

create database security;

use mysql;

drop user if exists 'security_administrator'@'localhost', 'security_user'@'%', 'security_user'@'localhost', 'security_reader'@'localhost', 'security_reader'@'%';

delete from user where user in ('security_administrator', 'security_user');

CREATE USER 'security_administrator'@'localhost' IDENTIFIED BY 'ESA-Star2017LetsMake$$';
GRANT ALL PRIVILEGES ON security.* TO 'security_administrator'@'localhost';
CREATE USER 'security_user'@'%' IDENTIFIED BY '99TY6-as0!K-NyR7?-9q1AP-#LOmh';
GRANT SELECT, INSERT, UPDATE ON security.* TO 'security_user'@'%';
CREATE USER 'security_user'@'localhost' IDENTIFIED BY '99TY6-as0!K-NyR7?-9q1AP-#LOmh';
GRANT SELECT, INSERT, UPDATE ON security.* TO 'security_user'@'localhost';

FLUSH PRIVILEGES;

use security;

drop table if exists security_keys;

create table security_keys
(
kid bigint NOT NULL AUTO_INCREMENT,
user_name varchar(255) not null,
key_value text not null,
token text null,
token_date varchar(25) null,
PRIMARY KEY (kid)
);

insert into security_keys (user_name, key_value, token, token_date) values ('prophet', AES_ENCRYPT('prophet', UNHEX(SHA2('Master Application Administrator 2017-07-04', 512))), AES_ENCRYPT('prophet', UNHEX(SHA2('Master Application Administrator 2017-07-04 prophet', 512))), '2017-07-01');

update security_keys set kid = 0 where user_name = 'prophet';

insert into security_keys (user_name, key_value, token, token_date) values ('rlee1957', AES_ENCRYPT('rlee1957', UNHEX(SHA2('Russell Bert Lee 1957-07-08', 512))), AES_ENCRYPT('rlee1957', UNHEX(SHA2('Russell Bert Lee 1957-07-08 rlee1957', 512))), '2017-07-01');

drop table if exists devices;

create table devices
(
did bigint NOT NULL AUTO_INCREMENT,
device_info text not null,
device_hits bigint not null,
device_consecutive_failures bigint null,
last_timestamp varchar(25) not null,
PRIMARY KEY (did)
);

drop table if exists user_devices;

create table user_devices
(
udid bigint NOT NULL AUTO_INCREMENT,
kid bigint not null,
did bigint not null,
PRIMARY KEY (udid),
FOREIGN KEY (did) REFERENCES devices(did),
FOREIGN KEY (kid) REFERENCES security_keys(kid)
);

drop table if exists blacklist;

create table blacklist
(
id bigint NOT NULL AUTO_INCREMENT,
did bigint not null,
PRIMARY KEY (id),
FOREIGN KEY (did) REFERENCES devices(did)
);

drop table if exists application_keys;

create table application_keys
(
id integer NOT NULL,
application_name varchar(255) not null,
application_key varchar(8000) not null,
PRIMARY KEY (id)
);

insert into application_keys (id, application_name, application_key) values (-1, 'ESA-Star Test Suite', AES_ENCRYPT('ESA-Star 2017', UNHEX(SHA2('ESA-Star Test Suite', 512))));

insert into application_keys (id, application_name, application_key) values (0, 'ESA-Star Administration Application', AES_ENCRYPT('ESA-Star 2017', UNHEX(SHA2('ESA-Star Administration Application',512))));

insert into application_keys (id, application_name, application_key) values (1, 'ESA-Star Mobile Application', AES_ENCRYPT('ESA-Star 2017', UNHEX(SHA2('ESA-Star Mobile Application', 512))));

drop table if exists security_log;

create table security_log
(
slid bigint NOT NULL AUTO_INCREMENT,
kid bigint null,
service varchar(255) null,
device text null,
application varchar(255) null,
username varchar(255) null,
request_status varchar(100) not null,
status_msg text not null,
description text not null,
results text not null,
log_date varchar(25),
PRIMARY KEY (slid)
);
