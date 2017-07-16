drop table if exists system_menu_items;

create table system_menu_items
(
smiid bigint NOT NULL AUTO_INCREMENT,
application_id integer NOT NULL,
menu_label varchar(255) not null,
menu_url varchar(255) not null,
menu_description varchar(1000) null,
active tinyint NULL,
PRIMARY KEY (smiid)
);

insert into system_menu_items (application_id, menu_label, menu_url, menu_description, active) values (1, 'Merchant Administration', 'pages/merchants.php', 'Add,edit and remove merchants and merchant groups', 1);
insert into system_menu_items (application_id, menu_label, menu_url, menu_description, active) values (1, 'Menu Administration', 'pages/menus.php', 'Add,edit and remove menu items and menu groups', 1);
insert into system_menu_items (application_id, menu_label, menu_url, menu_description, active) values (1, 'Property Administration', 'pages/Property.php', 'Property configuration and settings', 1);