/*money 테이블생성*/
create table money
(
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	mdate datetime not null,
	kumak int not null,
	kumak_kubun varchar(10) not null,
	title varchar(50),
	part varchar(20) not null,
	jichul_kubun varchar(20)
);

desc money

insert into money values(default,'admin','2020-12-26',10000,'입금','비자금','기타','')
insert into money values(default,'admin','2020-12-26',5000,'입금','주은돈','기타','')
insert into money values(default,'admin','2020-12-26',4500,'지출','담배','기타','현금')
insert into money values(default,'admin','2020-12-26',1000,'지출','커피','기타','체크카드')

select * from money

select title from money where mid = 'admin' and kumak_kubun = '입금' group by title

select sum(kumak) from money where mid ="admin" and mdate = '2020-12-26' and kumak_kubun='입금'
select sum(kumak) from money where mid ="admin" and date_format(mdate,'%Y-%m') = '2020-12' and kumak_kubun='입금'

select jichul_kubun,sum(kumak) as 'kumak' from money where mid ="admin" and date_format(mdate,'%Y-%m') = '2021-01' and kumak_kubun='지출' group by jichul_kubun order by sum(kumak) desc

select * from money where mid = 'admin' and mdate = '2020-12-26' order by kumak_kubun asc,idx desc

/*money_part 테이블생성*/
create table money_part
(
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	part_title varchar(20) not null,
	part_kubun varchar(10) not null
);

desc money_part

insert into money_part values(default,'admin','기타','입금')
insert into money_part values(default,'admin','기타','지출')

select part_title from money_part where mid='admin' and part_kubun = '입금'


