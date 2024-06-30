/*!40101 SET NAMES utf8 */;
drop database if exists `pub`;
create database `pub`;

create table pub.info (
  sid varchar(12) not null,
  name varchar(12) not null,
  sex varchar(12) not null, 
  size varchar(12) not null
);
insert into pub.info values ('2021409', 'yy', 'F', 'X');
insert into pub.info values ('2021071', 'lw', 'M', 'XL'); 
insert into pub.info values ('2021405', 'zmq', 'M', 'XL'); 
insert into pub.info values ('2021012', 'wtz', 'M', 'XXXXL'); 
insert into pub.info values ('2021015', 'lcx', 'M', 'XXL'); 
insert into pub.info values ('2021002', 'wwd', 'M', 'XXL'); 
insert into pub.info values ('2021068', 'zyz', 'M', 'XL'); 
insert into pub.info values ('2021412', 'gmt', 'F', 'XL'); 
insert into pub.info values ('2021213', 'gjh', 'M', 'XXXXL'); 
insert into pub.info values ('2021139', 'ysl', 'M', 'XXL'); 
insert into pub.info values ('2021171', 'yzx', 'M', 'XXL'); 
insert into pub.info values ('2021179', 'czn', 'M', 'XL'); 
insert into pub.info values ('2021169', 'dwx', 'M', 'XL'); 
insert into pub.info values ('2021277', 'cym', 'M', 'S'); 
insert into pub.info values ('2021041', 'jsy', 'M', 'XXL'); 
insert into pub.info values ('2021070', 'lyq', 'F', 'L'); 
insert into pub.info values ('2021164', 'yyj', 'F', 'L'); 
insert into pub.info values ('2020193', 'hm', 'M', 'XL'); 
insert into pub.info values ('2021155', 'rsj', 'M', 'XL'); 
insert into pub.info values ('2021281', 'zay', 'X', 'XXL'); 

create table pub.sc (
  sid varchar(12) not null,
  name varchar(12) not null,
  score numeric(6, 1)
);

insert into pub.sc values ('2021409', 'yy', 99);
insert into pub.sc values ('2021071', 'lw', 99);
insert into pub.sc values ('2021405', 'zmq', 98);
insert into pub.sc values ('2021012', 'wtz', 98);
insert into pub.sc values ('2021015', 'lcx', 97);
insert into pub.sc values ('2021002', 'wwd', 97);
insert into pub.sc values ('2021068', 'zyz', 96);
insert into pub.sc values ('2021412', 'gmt', 96);
insert into pub.sc values ('2021213', 'gjh', 95);
insert into pub.sc values ('2021139', 'ysl', 95);
insert into pub.sc values ('2021171', 'yzx', 94);
insert into pub.sc values ('2021179', 'czn', 94);
insert into pub.sc values ('2021169', 'dwx', 93);
insert into pub.sc values ('2021277', 'cym', 52);
insert into pub.sc values ('2021041', 'jsy', 91);
insert into pub.sc values ('2021070', 'lyq', 90);
insert into pub.sc values ('2021164', 'yyj', 98);
insert into pub.sc values ('2020193', 'hm', 98);
insert into pub.sc values ('2021155', 'rsj', 79);
insert into pub.sc values ('2021281', 'zay', 60);

create table pub.pe(
  sid varchar(12) not null,
  class varchar(12)
);
insert into pub.pe values ('2021405', 'pingpong');
insert into pub.pe values ('2021012', 'pingpong');
insert into pub.pe values ('2021179', 'pingpong');
insert into pub.pe values ('2021169', 'pingpong');
insert into pub.pe values ('2021070', 'pingpong');
insert into pub.pe values ('2021164', 'badminton');
insert into pub.pe values ('2021015', 'badminton');
insert into pub.pe values ('2021002', 'badminton');
insert into pub.pe values ('2021139', null);
insert into pub.pe values ('2021171', 'badminton');
insert into pub.pe values ('2021277', 'badminton');
insert into pub.pe values ('2021068', 'badminton');
insert into pub.pe values ('2021412', 'swimming');
insert into pub.pe values ('2021213', 'swimming');
insert into pub.pe values ('2021041', 'swimming');
insert into pub.pe values ('2021155', 'swimming');
insert into pub.pe values ('2021281', 'swimming');


drop user if exists 'student1';
drop database if exists `student1`;
create user 'student1'@'%' identified by '123456';
create database `student1`;
grant all on student1.* to 'student1' with grant option;
grant select on pub.* to 'student1';

drop user if exists 'student2';
drop database if exists `student2`;
create user 'student2'@'%' identified by '123456';
create database `student2`;
grant all on student2.* to 'student2' with grant option;
grant select on pub.* to 'student2';

drop database if exists `answer`;
create database `answer`;
create table answer.test0_0 as (
  select * from pub.sc
);
create table answer.test0_1 as (
  select avg(score) as avg_score from pub.sc
);
create table answer.test0_2(
  sid varchar(12) not null,
  name varchar(12) not null
);
insert into answer.test0_2 values('2020193', 'hm');
create table answer.test0_3(
  sid varchar(12) not null,
  name varchar(12) not null
);
insert into answer.test0_3 values ('2021012', 'wtz'); 
insert into answer.test0_3 values ('2021213', 'gjh'); 
create table answer.test0_4(
  sid varchar(12) not null,
  name varchar(12) not null, 
  sex varchar(12) not null, 
  score numeric(6, 1)
);
insert into answer.test0_4 values ('2021277', 'cym', 'M', 52);
insert into answer.test0_4 values ('2021281', 'zay', 'X', 60);

create table answer.test0_5 as (
  select size, count(*) as cnt from pub.info
  group by size
);

create table answer.test0_6 as (
  select name from pub.info, pub.pe
  where pub.info.sid = pub.pe.sid and pub.pe.class is null
);

create table answer.test0_7 as (
  select pub.info.sid from pub.info, pub.pe
  where pub.info.sid not in (select sid from pub.pe)
);

create table answer.test0_8 as (
  select pub.info.sid from pub.info, pub.pe
  where pub.info.sid not in (select sid from pub.pe)
  order by pub.info.sid
);

create table answer.test0_9 as (
  select pub.info.sid, pub.info.name, pub.info.sex, pub.info.size, pub.sc.score, pub.pe.class
  from pub.info, pub.sc, pub.pe
  where pub.info.sid = pub.sc.sid and pub.sc.sid = pub.pe.sid
);

drop database if exists `manage`;
create database `manage`;
use manage;

create table record(
  sid varchar(12) not null,
  submission_time datetime not null,
  test_id varchar(12) not null,
  result varchar(30) not null,
  primary key (sid, test_id)
);

create table test_table(
  test_id varchar(12) primary key,
  test_name varchar(12) not null,
  test_desc text not null,
  set_id varchar(12) not null,
  expected_time datetime not null,
  score int not null
);


insert into test_table values ('test0_0', '测试题目1', '创建一个表test0_0，有三列  sid varchar(12) not null, name varchar(12) not null, score numeric(6, 1)，
  输出 pub.sc 里的所有信息', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_1', '测试题目2', '创建一个表test0_1，仅一列 avg_score，返回所有同学的平均成绩。', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_2', '测试题目3', '创建一个表test0_2，有两列  sid varchar(12) not null,
  name varchar(12) not null， 在 pub.info 表里找出学号开头不是 2021 的同学', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_3', '测试题目4', '创建一个表test0_3，有两列  sid varchar(12) not null,
  name varchar(12) not null， 在 pub.info 表里找出 T 恤尺码是 XXXXL 的同学', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_4', '测试题目5', '创建一个表test0_4，有四列  sid varchar(12) not null,
  name varchar(12) not null, sex varchar(12) not null, score numeric(6, 1)，
  在 pub.info 和 pub.sc 里找到成绩 <= 60 的同学', '0', '1989-06-04 05:00', 2);
insert into test_table values ('test0_5', '测试题目 6','创建一个表，test_05，有两列，size varchar(12) not null, cnt numeric(6, 1)，在 pub.info 中统计各个 T 恤尺码的学生人数', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_6', '测试题目 7','创建一个表，test_06，找到在 pub.pe 表中选课信息为 null 的学生姓名', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_7', '测试题目 8','创建一个表，test_07，找到没有出现在 pub.pe 中的学生学号，按从小到大排序', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_8', '测试题目 9','创建一个表，test_08，找到选课为游泳（swimming) 的男生（M）的学号，按从小到大排序', '0', '1989-06-04 05:00', 1);
insert into test_table values ('test0_9', '测试题目 10','创建一个表，test_09，共 6 列：
sid varchar(12) not null,  name varchar(12) not null,  sex varchar(12) not null,  size varchar(12) not null, score numeric(6, 1), class varchar(12)，
表示每个学生的所有信息，未出现的信息填充 null
', '0', '1989-06-04 05:00', 1);


create table student_info(
  sid varchar(12) not null,
  sql_name varchar(20) not null
  -- stu_name varchar(12) not null,
);

create table saved_query(
  sid varchar(12) primary key,
  query text not null
);

create view student_score as
  select sid, COALESCE(sum(score), 0) total_score
  from record join test_table tt on record.test_id = tt.test_id
  where result = 'success'
  group by sid;