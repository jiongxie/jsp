show tables;

create table board (
  idx    int  not null auto_increment,
  name   varchar(20) not null,
  title   varchar(100) not null, 			/* 게시글의 글제목 */
  email  varchar(50),
  homepage varchar(50),
  pwd			varchar(20)  not null,
  wdate		datetime  default now(),		/* 게시글 올린 날짜 */
  readnum	int default 0,							/* 글 조회수 */
  hostip  varchar(50) not null,				/* 접속 PC의 IP */
  good    int default 0,							/* 좋아요(별점주기) */
  content text not null,							/* 게시글의 글 내용 */
  primary key(idx)
);
desc board;
drop table board;
delete from board;
insert into board values (default,'관리자','게시판 서비스를 시작합니다.','cjsk1126@hanmail.net','blog.daum.net/cjsk1126','1234',default,default,'218.236.203.76',default,'게시판 서비스 게시.. 잘 부탁드립니다.');
insert into board values (default,'홍길동','안녕하세요.','hkd1234@hanmail.net','blog.daum.net/hkd1234','1234',default,default,'218.236.203.76',default,'게시판이 공사중이군요..');
insert into board values (default,'이기자','잠시 들러봅니다.','lkj@hanmail.net','blog.daum.net/lkj','1234',default,default,'218.236.203.76',default,'좋은 결과 있길 기대합니다.');

select * from board order by idx desc;
select * from board where name like '%관리%';


------------- 댓글 처리 ----------------

create table board_cont (
  idx  int not null auto_increment primary key,
  board_idx int not null,			   /* 현재댓글의 부모게시글의 고유번호 */
  mid  varchar(20) not null,                /* 아이디 */
  nickname varchar(20) not null,            /* 닉네임 */
  wdate    datetime not null default now(), /* 댓글 올린 날짜 */
  hostip   varchar(50) not null,						/* 댓글 작성자의 IP */
  content  text not null,										/* 댓글내용 */
  foreign key(board_idx) references board(idx) /* 외래키 */
/*  on update cascade  */
/*  on delete RESTRICT */
);
desc board_cont;
alter table board_cont change column board_id board_idx int not null;
delete from board_cont;
select * from board_cont order by idx desc;
