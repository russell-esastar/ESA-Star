drop table if exists applications;

create table applications
(
application_id integer NOT NULL AUTO_INCREMENT,
application_type varchar(255) not null,
application_name varchar(255) not null,
application_description varchar(1000) null,
merchant_id bigint NULL,
url varchar(3000) null,
active tinyint not null,
date_created varchar(25) not null,
PRIMARY KEY (application_id)
);

insert into applications (application_type, application_name, application_description, merchant_id, url, active, date_created) values ('ESA-Star Administration', 'ESA-Star Administration Application', 'Esa application used to manage, maintain and analyze data.', NULL, 'landing.php?application_name=esastar_application_menu', 1, '2017-04-26');
insert into applications (application_type, application_name, application_description, merchant_id, url, active, date_created) values ('ESA-Star Mobile Application', 'ESA-Star Mobile Application', 'Esa mobile application available to the general population for free.', NULL, NULL, 1, '2017-04-26');
insert into applications (application_type, application_name, application_description, merchant_id, url, active, date_created) values ('ESA-Star Administration', 'ESA-Star Test Suite', 'Esa-Star testing suite.', NULL, NULL, 0, '2017-04-26');
insert into applications (application_type, application_name, application_description, merchant_id, url, active, date_created) values ('ESA-Star Administration', 'ESA-Star Merchants Administration', 'Add, Edit and Remove Merchants.', NULL, 'landing.php?application_name=merchants', 1, '2017-04-26');
insert into applications (application_type, application_name, application_description, merchant_id, url, active, date_created) values ('ESA-Star Administration', 'ESA-Star Applications Administration', 'Add, Edit and Remove Applications.', NULL, 'landing.php?application_name=applications', 1, '2017-04-26');
insert into applications (application_type, application_name, application_description, merchant_id, url, active, date_created) values ('ESA-Star Administration', 'ESA-Star Accounts Administration', 'Add, Edit and Remove Accounts.', NULL, 'landing.php?application_name=accounts', 1, '2017-04-26');