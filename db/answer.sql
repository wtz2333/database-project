
create table test0_0 as select sid,name from pub.info where sid not in (select sid from pub.info where sid REGEXP '^2021');
create table test0_1 as select sid,name from pub.info where size = 'XXXXL'
create table test0_2 as select sid,name,sex,score from pub.info natural join pub.sc where score <= 60