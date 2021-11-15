create table schedule2 (
  idx    int  not null auto_increment primary key, /* 고유번호 */
  mid    varchar(20) not null,    	          /* 회원 고유 아이디 */
  scdate datetime    not null default now(),  /* 일정 등록 날짜 */
  memory varchar(10) not null,	/* 기념일(1:모임,2:업무,3:학습,4:여행,0:기타) */
  title  varchar(100) not null,								/* 일정 제목(달력에 표시되는 문자열) */
  content text not null												/* 일정 상세 내역 */
);

desc schedule2;
delete from schedule2;

insert into schedule2 values (default,'hkd1234','2020-12-24','모임','가족모임','크리스마스는 5인이하의 가족과 함께... 장소:집, 시간:18시');

select * from schedule2;
select * from schedule2 where scdate='2020-12-24' and mid='hkd1234';

