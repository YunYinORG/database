/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/6/6 19:00:00                           */
/*==============================================================*/


-- drop table if exists card;

-- drop table if exists cardlog;

drop table if exists code;

drop table if exists device;

drop table if exists feedback;

drop table if exists file;

drop table if exists notification;

drop table if exists printer;

drop table if exists school;

drop table if exists token;

drop table if exists user;

drop table if exists share;

drop table if exists hastag;

drop table if exists tag;

SET names utf8;

/*==============================================================*/
/* Table: card                                                  */
/*==============================================================*/
-- create table card
-- (
--    id                   bigint not null,
--    off                  tinyint default 0,
--    blocked              bool default 0,
--    primary key (id)
-- );

/*==============================================================*/
/* Table: cardlog                                               */
/*==============================================================*/
-- create table cardlog
-- (
--    id                   bigint not null auto_increment,
--    find_id              bigint not null,
--    lost_id              bigint not null,
--    time                 timestamp default CURRENT_TIMESTAMP,
--    status               tinyint,
--    primary key (id)
-- );

/*==============================================================*/
/* Table: code                                                  */
/*==============================================================*/
create table code
(
   id                   bigint not null auto_increment,
   use_id               bigint not null,
   code                 char(32),
   time                 timestamp not null default CURRENT_TIMESTAMP,
   type                 tinyint,
   content              varchar(64),
   primary key (id)
);

/*==============================================================*/
/* Table: device                                                */
/*==============================================================*/
/*
create table device
(
   id                   bigint not null,
   code                 varchar(16),
   last_login           timestamp default CURRENT_TIMESTAMP,
   status               tinyint,
   type                 tinyint,
   primary key (id)
);*/

/*==============================================================*/
/* Table: feedback                                              */
/*==============================================================*/
create table feedback
(
   id                   bigint not null auto_increment,
   email                char(32),
   phone                char(16),
   message              text,
   time                 timestamp not null default CURRENT_TIMESTAMP,
   primary key (id)
);

/*==============================================================*/
/* Table: file                                                  */
/*==============================================================*/

create table file
(
	id                  bigint not null auto_increment,
	use_id				bigint not null,
	name                varchar(32),
	url                	char(48),
	time              	timestamp not null default CURRENT_TIMESTAMP,
   status         tinyint not null default 1,
	primary key (id)
);

create table task
(
	id                  bigint not null auto_increment,
	use_id				bigint not null,
	pri_id				bigint not null,
   url            char(48) not null,
   name varchar(32),
	requirements       	varchar(128),
	copies              int default 1,
	`double`         bool,
	status              tinyint default 1,
	color               bool,
	format          tinyint default 0,
	payed              tinyint default 0,
   time                 timestamp not null default CURRENT_TIMESTAMP,
	primary key (id)
);

/*==============================================================*/
/* Table: notification                                          */
/*==============================================================*/
-- create table notification
-- (
--    id                   bigint not null auto_increment,
--    tas_id              bigint not null,
--    content              text,
--    to_id                bigint,
--    type                 tinyint,
--    primary key (id)
-- );

/*==============================================================*/
/* Table: printer                                               */
/*==============================================================*/
create table printer
(
   id                   bigint not null auto_increment,
   sch_id               bigint not null,
   name                 char(16) not null,
   account              char(16) not null,
   password             char(32) not null,
   address              char(32),
   email                varchar(64),
   phone                char(16),
   qq                   char(16),
   wechat               char(16),
   profile              text,
   image                varchar(64),
   open                 varchar(32),
   status               tinyint default 1,
   rank                 int default 0,
   price                text,
   other           text,
   primary key (id),
   unique key AK_account_unique (account)
);

/*==============================================================*/
/* Table: school                                                */
/*==============================================================*/
create table school
(
   id                   bigint not null auto_increment,
   name                 char(32),
   address              varchar(128),
   abbr                 char(8),
   verify               varchar(16),
   verifyurl            varchar(32),
   primary key (id)
);


/*==============================================================*/
/* Table: token                                                 */
/*==============================================================*/
create table token
(
   to_id                bigint not null,
   type                 tinyint not null,
   time                 timestamp not null default CURRENT_TIMESTAMP,
   token                char(48),
   primary key (to_id, type),
   unique key AK_token_unique (token)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   bigint not null auto_increment,
   sch_id               bigint not null,
   number       char(12),
   password             char(32),
   name                 char(8),
   gender               char(2),
   phone                char(16),
   email                char(64),
   status               tinyint default 1,
   regtime           timestamp default CURRENT_TIMESTAMP,
   primary key (id),
   unique key AK_number_unique (number,sch_id)
);

/*==============================================================*/
/* Table: share                                                  */
/*==============================================================*/
create table share
(
	id 					bigint not null auto_increment,
	fil_id				bigint not null,
   use_id            bigint not null,
   detail            text,
   url               char(48),
	time 				timestamp not null default CURRENT_TIMESTAMP,
	name 				char(32) not null,
	anonymous 			bool,
	reference			bigint default 0,
	primary key(id),
	unique key share_file_unique (fil_id),
   unique key share_url_unique (url),
	check(reference >= 0)
);

/*==============================================================*/
/* Table: tag                                                  */
/*==============================================================*/
create table tag
(
	id 					bigint not null auto_increment,
	use_id 			   	bigint not null,
	name 			    char(16) not null,
	count 				bigint default 0,
	time 				timestamp not null default CURRENT_TIMESTAMP,
	primary key(id),
	unique key tag_name_unique (name)
);

/*==============================================================*/
/* Table: hastag                                            */
/*==============================================================*/
create table hastag
(
	sha_id 			bigint not null,
	tag_id 				bigint not null,
	time 				timestamp not null default CURRENT_TIMESTAMP,
	primary key(sha_id,tag_id)
);

-- create table usershare
-- (
-- 	sha_id 			bigint not null,
-- 	use_id				bigint not null,
-- 	time				timestamp not null default CURRENT_TIMESTAMP,
-- 	primary key(sha_id,use_id)
-- );
/*=================================================教材*/
create table book
(
	id 					bigint	not null auto_increment,
	pri_id  			bigint not null,
	name 				char(32) not null,
	price				varchar(32) not null,
	image			varchar(64),
	detail 		text,
   count       int default 0,
	time                timestamp not null default CURRENT_TIMESTAMP,
	primary key(id)
);

-- alter table card add constraint FK_card_info_of_user foreign key (id)
--       references user (id) on delete restrict on update restrict;

-- alter table cardlog add constraint FK_user_find_card foreign key (find_id)
--       references user (id) on delete restrict on update restrict;

-- alter table cardlog add constraint FK_user_lost_card foreign key (lost_id)
--       references user (id) on delete restrict on update restrict;

alter table code add constraint FK_code_of_user foreign key (use_id)
      references user (id) on delete restrict on update restrict;

/*alter table device add constraint FK_mobile_device_of_user foreign key (id)
      references user (id) on delete restrict on update restrict;*/

alter table task add constraint FK_task_of_printer foreign key (pri_id)
      references printer (id) on delete restrict on update restrict;

alter table task add constraint FK_task_of_user foreign key (use_id)
      references user (id) on delete restrict on update restrict;

-- alter table task add constraint FK_task_of_file foreign key (fil_id)
--       references file (id) on delete restrict on update restrict;

-- alter table notification add constraint FK_notification_of_task foreign key (task_id)
--       references task (id) on delete restrict on update restrict;

alter table printer add constraint FK_printer_blong_to_school foreign key (sch_id)
      references school (id) on delete restrict on update restrict;

alter table user add constraint FK_user_blong_to_school foreign key (sch_id)
      references school (id) on delete restrict on update restrict;

alter table share add constraint FK_share_of_file foreign key (fil_id)
	  references file (id) on delete restrict on update restrict;

alter table tag add constraint FK_tag_of_user foreign key (use_id)
      references user (id) on delete restrict on update restrict;

alter table hastag add constraint FK_connection_of_share foreign key (sha_id)
	  references share (id) on delete restrict on update restrict;

alter table hastag add constraint FK_connetction_of_tag foreign key (tag_id)
      references tag (id) on delete restrict on update restrict;

-- alter table usershare add constraint FK_usershare_of_share foreign key (sha_id)
-- 	  references share (id) on delete restrict on update restrict;

-- alter table usershare add constraint FK_usershare_of_user foreign key (use_id)
      -- references user (id) on delete restrict on update restrict;
alter table share add constraint FK_share_of_user foreign key (use_id)
      references user (id) on delete restrict on update restrict;

alter table book add constraint FK_book_of_printer foreign key (pri_id)
      references printer (id) on delete restrict on update restrict;

alter table file add constraint FK_file_of_task foreign key (use_id)
      references user (id) on delete restrict on update restrict;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

INSERT INTO `school` (`id`, `name`, `address`,`abbr`,`verify`,`verifyurl`) VALUES
(1, '南开大学', '天津市 南开区 卫津路94号','nku','信息门户(URP)','http://urp.nku.cn'),
(2, '天津大学', '天津市 南开区 卫津路92号','tju','天大办公网','http://e.tju.edu.cn'),
(3, '天津商职', '天津市 海河教育园 雅观路23号','tifert','教务处网站','http://jw.tifert.edu.cn/2003/'),
(4, '河北工业大学', '天津市 北辰区 西平道5340号', 'hebut', '综合教务系统', 'http://115.24.160.162/'),
(5, '广州番禺职业学院', '广东省 广州市 番禺区市良路1342号','gzpyp','教务处网站','http://jw.gzpyp.edu.cn/'),
(6, '湖南理工学院', '湖南省 岳阳市 岳阳楼区学院路439号', 'hnist', '信息服务系统', 'http://info.hnist.cn/'),
(0, '无学校', '','all','','');

INSERT INTO `user`(`id`,`sch_id`) VALUES ('0','0' );
