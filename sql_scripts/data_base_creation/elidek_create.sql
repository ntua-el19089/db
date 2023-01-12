DROP SCHEMA IF EXISTS fart;
CREATE SCHEMA fart;
USE fart;

CREATE TABLE organization (
	org_id int(10) NOT NULL,
	abbrev varchar(15),
	`name` varchar(100),
	postal_code varchar(6),
	street varchar(100),
	city varchar(100),
	PRIMARY KEY (org_id) 
);


CREATE TABLE researcher (
	res_id int(10) NOT NULL,
	first_name varchar(100),
	last_name varchar(100),
	gender varchar(15),
	birthdate date,
	org_id int(10),
	empl_date date,
	FOREIGN KEY (org_id) references organization(org_id),
	PRIMARY KEY (res_id) 
);


CREATE TABLE program (
	prog_id int(10) NOT NULL,
	title varchar(100),
	department varchar(100),
	PRIMARY KEY (prog_id) 
);


CREATE TABLE executive (
	exec_id int(10) NOT NULL,
	first_name varchar(100),
	last_name varchar(100),
    PRIMARY KEY (exec_id) 
);


CREATE TABLE scientific_field (
	title varchar(100) NOT NULL,
	field_id int(10),
	PRIMARY KEY (field_id) 
);


CREATE TABLE project (
	proj_id int(10) NOT NULL,
	title varchar(100),
	budget float(17,2),
	started_on date,
	ends_on date,
	summary varchar(500) null,
	res_id int(10),
	prog_id int(10),
	exec_id int(10),
	org_id int(10),
	FOREIGN KEY (res_id) references researcher(res_id),
	FOREIGN KEY (prog_id) references program(prog_id),
	FOREIGN KEY (exec_id) references executive(exec_id),
	FOREIGN KEY (org_id) references organization(org_id),
	PRIMARY KEY (proj_id) 
);


CREATE TABLE works_on (
	proj_id int(10) NOT NULL,
	res_id int(10) NOT NULL,
	FOREIGN KEY (res_id) references researcher(res_id),
	FOREIGN KEY (proj_id) references project(proj_id),
	PRIMARY KEY (proj_id, res_id) 
);


CREATE TABLE evaluates (
	proj_id int(10) NOT NULL,
	res_id int(10) NOT NULL,
	grade int(3),
	`date` date,
	FOREIGN KEY (proj_id) references project(proj_id),
	FOREIGN KEY (res_id) references researcher(res_id),
	PRIMARY KEY (proj_id, res_id) 

);


CREATE TABLE field_project (
	proj_id int(10) NOT NULL,
	field_id int(10) NOT NULL,
	FOREIGN KEY (proj_id) references project(proj_id),
	FOREIGN KEY (field_id) references scientific_field(field_id),
	PRIMARY KEY (proj_id, field_id) 
);


CREATE TABLE task (
	proj_id int(10) NOT NULL,
	title varchar(100),
	summary varchar(500) null,
	due_date date,
	FOREIGN KEY (proj_id) references project(proj_id),
	PRIMARY KEY (proj_id, title) 
);


CREATE TABLE company (
	org_id int(10) NOT NULL,
	priv_funds float(17,2),
	FOREIGN KEY (org_id) references organization(org_id),
	PRIMARY KEY (org_id) 
);


CREATE TABLE research_center (
	org_id int(10) NOT NULL,
	priv_funds float(17,2),
	pub_funds float(17,2),
	FOREIGN KEY (org_id) references organization(org_id),
	PRIMARY KEY (org_id) 
);


CREATE TABLE university (
	org_id int(10) NOT NULL,
	pub_funds float(17,2),
	FOREIGN KEY (org_id) references organization(org_id),
	PRIMARY KEY (org_id) 
);


CREATE TABLE phone_numbers (
	org_id int(10) NOT NULL,
	ph_number varchar(15) NOT NULL,
	FOREIGN KEY (org_id) references organization(org_id),
	PRIMARY KEY (ph_number) 
);




