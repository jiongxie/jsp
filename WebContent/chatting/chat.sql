create table chat (
  idx    int  not  null  auto_increment primary key, /* 채팅 내용 고유번호 */
  nickname varchar(20)  not null,			/* 별명 */
  content  varchar(200) not null,			/* 채팅 내용 */
  cdate    datetime not null default now(),	/* 채팅 올린 날짜와 시간 */
  avatar   char(1)  not null default '1'		/* 아바타 */
);

insert into chat values (default, 'ㅍㅍㅍ', '안ㄴㄴㄴ녕!!!', default, 2);
insert into chat values (default, 'ㅂㅂㅂ', '안녕ㅇㅇ!!!', default, 3);
insert into chat values (default, 'ㅊㅊㅊ', '안녕ㄹㄹㄹ!!!', default, 5);
insert into chat values (default, 'ㅅㅅㅅ', '안녕ㅎㅎㅎ!!!', default, 4);
insert into chat values (default, 'ㅛㅛㅛ', '안녕!ㅗㅗㅗ!!', default, 3);
insert into chat values (default, 'ㅕㅕㅕ', '안ㅠㅠ녕!!!', default, 2);
insert into chat values (default, 'ㅑㅑㅑ', '안ㅜㅜㅜ녕!!!', default, 1);

select * from chat order by idx desc;
select * from chat order by idx;

select * from chat where idx > 1 order by idx

delete from chat;

select * from chat where idx > 22 order by idx;


