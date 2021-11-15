/* 설문지 내역(설문 문항) 작성 테이블 */
create table survey (
  idx   int not null auto_increment,  	/* 설문지 고유번호 */
  sdate datetime default now(),				/* 설문시작일 */
  kwajung varchar(60) not null,		/* 분류 */
  kwamok	varchar(60) not null,		/* 상품명 */
  kcode		varchar(60) not null, 	/* 설문단위코드 */
  danwi		varchar(60) not null,		/* 설문단위명 */
  wdate   varchar(60) not null,		/* 설문종료일 */
  question1 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  question2 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  question3 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  question4 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  question5 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  question6 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  question7 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  question8 varchar(100) not null, /* 설문평가 문항지 1~8개 */
  primary key (idx)
);
desc survey;
delete from survey;
alter table survey alter column sdate datetime default 0;
select * from survey order by idx desc;
drop table survey;

/* 설문지에 대한 각 항목에 응답한 내역을 저장하는 테이블 설계 */
create table survey_answer (
  idx   int  not null auto_increment, /* 응답내역에 대한 고유번호 */
  survey_idx int not null,						/* 현재 작성하고있는 '설문지의 고유번호' */
  answer1    int not null,						/* 설문지의 해당 항목 답변번호(1~5)의 점수 */
  answer2    int not null,						/* 설문지의 해당 항목 답변번호(1~5)의 점수 */
  answer3    int not null,						/* 설문지의 해당 항목 답변번호(1~5)의 점수 */
  answer4    int not null,						/* 설문지의 해당 항목 답변번호(1~5)의 점수 */
  answer5    int not null,						/* 설문지의 해당 항목 답변번호(1~5)의 점수 */
  answer6    int not null,						/* 설문지의 해당 항목 답변번호(1~5)의 점수 */
  answer7    int not null,						/* 설문지의 해당 항목 답변번호(1~5)의 점수 */
  answer8    text,										/* 건의사항 */
  primary key (idx),
  foreign key (survey_idx) references survey(idx)
  on update cascade on delete RESTRICT
);
desc survey_answer;
alter table survey_answer add mid varchar(20);
delete from survey_answer where mid = 'admin';
alter table survey_answer drop mid ;
select * from survey_answer;
delete form survey_answer;
drop table survey_answer;

create table survey_check (
	idx int not null auto_increment,
	survey_idx  int,
	mid varchar(20),
	primary key(idx),
	foreign key(survey_idx) references survey(idx)
);
desc survey_check;
insert into survey_check values(default,1,'aaa');
drop table survey_check;
select * from survey_check;