create table schedule (
  idx    int  not null auto_increment primary key, /* 고유번호 */
  mid    varchar(20) not null,    	          /* 회원 고유 아이디 */
  scdate datetime    not null default now(),  /* 일정 등록 날짜 */
  memory varchar(10) not null,	/* 기념일(1:모임,2:업무,3:학습,4:여행,0:기타) */
  title  varchar(100) not null,								/* 일정 제목(달력에 표시되는 문자열) */
  content text not null												/* 일정 상세 내역 */
);
drop table schedule;
desc schedule;
drop table schedule;
insert into schedule values (default,'qqq','2020-12-23','모임','투자설명회','헷지펀드 투자유치 장소:그랜드 호텔, 시간:18시');
insert into schedule values (default,'qqq','2020-12-24','학습','주주총회','4분기 실적발표 다음 분기 계획... 장소:서울본사, 시간:16시');
insert into schedule values (default,'admin','2020-12-25','모임','투자설명회','헷지펀드 투자유치 장소:그랜드 호텔, 시간:18시');
insert into schedule values (default,'admin','2020-12-26','학습','주주총회','4분기 실적발표 다음 분기 계획... 장소:서울본사, 시간:16시');

select * from schedule;
