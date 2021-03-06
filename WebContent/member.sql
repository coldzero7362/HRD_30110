create table member_tbl_02(
	custno number(6) not null primary key,
	custname VARCHAR2(20),
	phone VARCHAR2(13),
	address VARCHAR2(4) check(address in ('SK','KT','LG')),
	joindate date,
	grade char(1),
	city char(2)
);
drop table member_tbl_02;

insert into MEMBER_TBL_02 values (100001,'김행복','010-1111-2222','SK','2015-12-02','A','01');
insert into MEMBER_TBL_02 values (100002,'이축복','010-1111-3333','SK','2015-12-06','B','01');
insert into MEMBER_TBL_02 values (100003,'정믿음','010-1111-4444','LG','2015-10-01','B','30');
insert into MEMBER_TBL_02 values (100004,'최사랑','010-1111-5555','KT','2015-11-13','A','30');
insert into MEMBER_TBL_02 values (100005,'진평화','010-1111-6666','SK','2015-12-25','B','60');
insert into MEMBER_TBL_02 values (100006,'차공단','010-1111-7777','LG','2015-12-11','C','60');

create table money_tbl_02(
	custno number(6),
	salenol number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode VARCHAR2(4),
	sdate date,
	PRIMARY KEY(custno, salenol)
);

select * from money_tbl_02;
select * from member_tbl_02;
SELECT MAX(CUSTNO) FROM member_tbl_02;
insert into money_tbl_02 values(100001,20160001,500,5,2500,'A001','2016-01-01');
insert into money_tbl_02 values(100001,20160002,1000,4,4000,'A002','2016-01-01');
insert into money_tbl_02 values(100001,20160003,500,3,1500,'A008','2016-01-01');
insert into money_tbl_02 values(100002,20160004,2000,1,2000,'A004','2016-01-02');
insert into money_tbl_02 values(100002,20160005,500,1,500,'A001','2016-01-03');
insert into money_tbl_02 values(100003,20160006,1500,2,3000,'A003','2016-01-03');
insert into money_tbl_02 values(100004,20160007,500,2,1000,'A001','2016-01-04');
insert into money_tbl_02 values(100004,20160008,300,1,300,'A005','2016-01-04');
insert into money_tbl_02 values(100004,20160009,600,1,600,'A006','2016-01-04');
insert into money_tbl_02 values(100004,20160010,3000,1,3000,'A007','2016-01-06');

SELECT * FROM member_tbl_02 a, money_tbl_02 b WHERE a.custno = b.custno GROUP by a.custno, a.custname, a.grade ORDER by price DESC;