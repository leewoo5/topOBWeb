--
-- CREATE table
--

CREATE TABLE tbl_user
(
   uid            VARCHAR(50) NOT NULL,
   upw            VARCHAR(50) NOT NULL,
   uname          VARCHAR(100) NOT NULL,
   upoint         int NOT NULL DEFAULT 0,
   email		  varchar(50),
   regdate        TIMESTAMP DEFAULT now(),
   sessionkey     varchar(50) NOT NULL DEFAULT 'none',
   sessionlimit   timestamp NOT NULL DEFAULT now(),
   PRIMARY KEY(uid)
);
CREATE TABLE tbl_intro
(
   img          VARCHAR(50) NOT NULL,
   title          VARCHAR(50) NOT NULL,
   content        VARCHAR(1000) NOT NULL,
   author         VARCHAR(50) NOT NULL,
   regdate        TIMESTAMP DEFAULT now()
);
CREATE TABLE tbl_act
(
   name			VARCHAR(20) NOT NULL,
   img          VARCHAR(50) NOT NULL,
   title          VARCHAR(50) NOT NULL,
   content        VARCHAR(1000) NOT NULL,
   PRIMARY KEY(name)
);

CREATE TABLE tbl_org
(
   img          VARCHAR(50) NOT NULL
);

--관리자 계정 생성
insert into tbl_user(uid, upw, uname, email)
	 values ('admin', '1234', 'ADMINISTRATOR','topfactory@gmail.com');

