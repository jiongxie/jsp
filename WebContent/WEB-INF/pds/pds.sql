create table pds (
  idx  int not null auto_increment,
  mid  varchar(20) not null,
  nickname varchar(20) not null,
  fname    varchar(100) not null,   /* 업로드시에 올린 파일명 */
  rfname   varchar(100) not null, 	/* 실제로 서버에 저장되는 파일명 */
  title    varchar(100) not null,   /* 파일에 대한 기본설명(제목) */
  part		 varchar(20)  not null,		/* 파일 분류 */
  pwd      varchar(20)  not null,		/* 업로드 파일의 비밀번호 */
  fdate		 datetime     default now(), /* 업로드시킨 날짜 */
  fsize    varchar(100),						/* 파일 용량(크기) */
  downnum  int  default 0,					/* 파일 다운 횟수 */
  opensw	 varchar(10) default '공개', /* 파일 공개 여부(공개/비공개) */
  content  text,										/* 파일 상세 설명 */
  primary key (idx)
);
desc pds;
drop table pds;

select * from pds order by idx desc;
select * from pds where opensw = '비공개';
select count(*) from pds;
select * from pds order by idx desc limit 1,2;
select * from pds where part = '통계' order by ;


