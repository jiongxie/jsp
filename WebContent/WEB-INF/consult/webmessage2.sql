create table webmessage2 (
  idx     int not null auto_increment primary key,
  title   varchar(100) not null, 								/* 메세지 제목 */
  content text not null,												/* 메세지 내용 */
  sendId  varchar(20) not null,									/* 보내는 사람 아이디 */
  sendSw  char(1) not null default 's',					/* 보낸메세지(s), 휴지통삭제(x) 표시 */
  sendDate datetime default now(),							/* 보낸 날짜 */
  receiveId varchar(20) not null,								/* 받는 사람 아이디 */
  receiveSw char(1) not null default 'n',				/* 받는사람 새메세지(n), 읽은메세지(r), 휴지통(g), 삭제(x) 표시 */
  receiveDate datetime default now()						/* 받은날짜 --> 메세지 확인시 '읽은날짜'로 변경처리한다. */
);

desc webmessage;
drop table webmessage;
delete from webmessage;

insert into webmessage values (default,'안녕!! 말숙아~~~','이번주 년말에 계획있니?','hkd1234','s',default,'kms1234','n',default);
insert into webmessage values (default,'반갑다!! 길동아~~~','이번 년말은 코로나로 집에만 있을거야~~ㅜㅜ','kms1234','s',default,'hkd1234','n',default);

select * from webmessage2 order by idx desc;
