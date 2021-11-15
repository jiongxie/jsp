create table member (
  idx  int  not null auto_increment,  /* 회원 고유번호 */
  mid  varchar(20) not null,					/* 회원 아이디(중복불허) */
  pwd  varchar(20) not null,					/* 비밀번호 */
  nickname varchar(20) not null,			/* 별명(중복불허) */
  name varchar(20) not null,					/* 회원 성명 */
  gender char(4) default '남자',			  /* 성별 */
  birthday datetime,									/* 생일 */
  tel		varchar(15) not null,					/* 연락처 */
  address varchar(50),								/* 주소 */
  email		varchar(50),								/* 이메일 */
  homepage varchar(50),								/* 홈페이지 */
  job			varchar(20),								/* 직업 */
  hobby   varchar(30),								/* 취미 */
  userinfor char(4) default '공개', 		/* 회원 정보 공개 여부 */
  userdel   char(2) default 'NO',			/* 회원 탈퇴 신청 여부(OK:탈퇴신청, NO:가입중) */ 
  level		int default 1,							/*  0:관리자, 1:준회원, 2:정회원, 3:우수회원 */
	visitCnt  int default 0,						/* 방문 횟수 */
	startDate datetime default now(),    /*최초 가입일 */
	lastDate datetime default now(),     /*마지막 접속일 */
  primary key(idx)
);
desc member;
drop table member;
alter table member add visitCnt int default 0;
alter table member add startDate datetime default now();
alter table member add lastDate datetime default now();

insert into member values (default,'admin','1234','관리자','관리자',default,'2000-1-1','010-3423-2307','경기도 안성시 공도읍','byeonhs0018@naver.com','byeonhs0018@naver.com','기타','기타',default,default,0,'1','2020-11-01','2020-11-05');
insert into member values (default,'atin','1234','아틴','아틴',default,'2000-1-1','010-3423-2307','경기도 안성시 공도읍','cjsk1126@naver.com','blog.daum.net/cjsk1126','회사원','등산',default,default,0,'1','2020-11-01','2020-11-05',default);

delete from member where idx=4;
update member set level='2' where mid='aaa';
update member set startDate = '2020-11-01';
update member set lastDate = now();
alter table member add money int default 0;
alter table member add earn float default 0;
alter table member drop earn;
update member set money = '10000' where mid='aaa';
update member set money = '10000' where mid='admin';
update member set level = 1 where mid = 'atin';
update member set money = '10000' where mid = 'admin';

select * from member order by idx desc;


