create table taginfo(
    tag_id int not null PRIMARY KEY auto_increment,
		tag_name varchar(50) not null DEFAULT '',
		tag_desc varchar(600) not null DEFAULT ''
)engine = innodb;
create table admininfo(
    admin_id int not null PRIMARY KEY auto_increment,
		admin_name varchar(64) not null DEFAULT '',
		admin_pwd varchar(64) not null DEFAULT ''
)engine = innodb;
create table userinfo(
    user_id int not null PRIMARY KEY auto_increment,
		user_name varchar(64) not null DEFAULT '',
		user_pwd varchar(64) not null DEFAULT '',
		user_phone varchar(20) not null DEFAULT '',
		user_score int not null DEFAULT 0
)engine = innodb;