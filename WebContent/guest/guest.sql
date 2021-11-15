/* guest.sql */
create table guest (
  idx   int not null auto_increment primary key,  /* 怨좎쑀踰덊샇 */
  name  varchar(20) not null,											/* 諛⑸Ц�옄 �씠由� */
  email varchar(60),															/* �씠硫붿씪 二쇱냼 */
  homepage varchar(60),														/* �솃�럹�씠吏�(釉붾줈洹�)二쇱냼 */
  vdate datetime default now(),										/* 諛⑸Ц�씪�옄 */
  hostip varchar(50) not null,										/* 諛⑸Ц�옄 IP */
  content text not null														/* 諛⑸Ц�냼媛� */
);

desc guest;

insert into guest values (default, '愿�由ъ옄', 'byeonhs0018@naver.com', 'blog.daum.net/cjsk1126', default, 'http://218.236.203.76:9090/zone/','諛⑸챸濡� �꽌鍮꾩뒪瑜� �떆�옉�빀�땲�떎.');
insert into guest values (default, '�뿤�뿤�뿤', 'cjsk1126@naver.com', 'blog.daum.net/cjsk1126', default, 'http://218.236.203.76:9090/zone/','諛⑸챸濡� �꽌鍮꾩뒪瑜� �떆�옉�빀�땲�떎.');

delete from guest where name='sdg';
delete from guest;
select * from guest order by idx desc;
