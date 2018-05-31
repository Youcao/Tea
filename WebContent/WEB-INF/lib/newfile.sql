SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS user_table;




/* Create Tables */

CREATE TABLE user_table
(
	userid int NOT NULL AUTO_INCREMENT,
	username varchar(20) NOT NULL,
	password varchar(20) NOT NULL,
	sex int NOT NULL,
	phonenumber int NOT NULL,
	email varchar(20) NOT NULL,
	PRIMARY KEY (userid)
);



