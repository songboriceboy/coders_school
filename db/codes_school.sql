create table taginfo(
    tag_id int not null PRIMARY KEY auto_increment,
		tag_name varchar(50) not null DEFAULT '',
		tag_desc varchar(600) not null DEFAULT '',
		tag_logo_path varchar(300) not null DEFAULT ''
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
		user_avatar varchar(200) not null DEFAULT '',
		user_score int not null DEFAULT 0,
		user_nicker varchar(64) not null DEFAULT '',
		user_job varchar(64) not null DEFAULT '',
		user_company varchar(100) not null DEFAULT '',
		user_intro varchar(200) not null DEFAULT '',
		user_site varchar(200) not null DEFAULT '',
		user_email varchar(64) not null DEFAULT '',
		user_github varchar(100) not null DEFAULT '',
		user_weixin varchar(100) not null DEFAULT '',
		user_qq varchar(100) not null DEFAULT '',
		user_sina_weibo varchar(100) not null DEFAULT ''
)engine = innodb;
create table section_info(
    section_id int not null PRIMARY KEY auto_increment,
		section_name varchar(50) not null DEFAULT '',
		section_desc varchar(600) not null DEFAULT '',
		section_parent_id int not null DEFAULT -1
)engine = innodb;



insert into section_info(section_name,section_desc,section_parent_id)
values('问与答','问与答',-1);
insert into section_info(section_name,section_desc,section_parent_id)
values('技术分享','技术分享',-1);

create table topic_info(
    topic_id int not null PRIMARY KEY auto_increment,
		topic_title varchar(200) not null DEFAULT '',
		topic_content longtext not null DEFAULT '',
		topic_markdown_content longtext not null DEFAULT '',
		topic_createtime TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP(),
		section_id int not null DEFAULT -1,
		user_id int not null DEFAULT -1
)engine = innodb;

DROP TABLE IF EXISTS topic_comment_info;
CREATE TABLE topic_comment_info (
  comment_id int(11) NOT NULL AUTO_INCREMENT,
  comment_content longtext NOT NULL DEFAULT '',
  comment_markdown_content longtext NOT NULL DEFAULT '',
  comment_createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  topic_id int(11) NOT NULL DEFAULT '-1',
  reply_comment_id int(11) NOT NULL DEFAULT '-1',
  user_id int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (comment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table tag_topic_info
(
	tag_topic_info_id int not null PRIMARY KEY auto_increment,
	topic_id int not null default 0,
	tag_id int not null default 0
)engine = innodb;

create table tag_user_info
(
	tag_user_info_id int not null PRIMARY KEY auto_increment,
	user_id int not null default 0,
	tag_id int not null default 0
)engine = innodb;

create table follow_info
(
	follow_info_id int not null PRIMARY KEY auto_increment,
	follower_id int not null default 0,-- 粉丝
	followee_id int not null default 0 -- 被关注者
)engine = innodb;
create table user_topic_love
(
	user_topic_love_id int not null PRIMARY KEY auto_increment,
	user_id int not null default 0,-- 粉丝
	topic_id int not null default 0 -- 被关注者
)engine = innodb;

