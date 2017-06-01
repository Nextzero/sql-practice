
/*
1.查询课程1的成绩 比 课程2的成绩 高 的所有学生的学号.
tips：子查询与左连接的效率比较
*/
SELECT
	a.*
FROM sc AS a
LEFT JOIN sc b ON a.sno=b.sno
WHERE a.cno=1 AND b.cno=2 AND a.score>b.score;


/*
2.查询平均成绩大于60分的同学的学号和平均成绩
*/
SELECT
      sno,
      avg(score) AS score
FROM sc
GROUP BY sno
HAVING score > 60;


/*
3.查询所有同学的学号、姓名、选课数、总成绩
tips：
     多个GROUP BY参数
     除聚集计算语句外，SELECT语句中的每一列都必须在GROUP BY子句中给出。
*/
SELECT
      sst.sno AS '学号',
      sst.sname AS '姓名',
      COUNT(ssc.cno) AS '选课数',
      SUM(ssc.score) AS '总成绩'
FROM sc AS ssc, student AS sst
WHERE ssc.sno=sst.sno
GROUP BY sst.sno,sst.sname;


/*
4.查询姓“李”的老师的个数；
MySQL通配符
%
_

*/
SELECT COUNT(*) FROM teacher WHERE tname LIKE '李%';


/*
5.查询没学过“叶平”老师课的同学的学号、姓名；
*/
SELECT
	sno AS '学号',
	sname AS '姓名'
FROM
	student
WHERE
	sno IN 
	(
	SELECT
		DISTINCT(sc.sno)
	FROM 
		sc,course,teacher
	WHERE
		sc.cno=course.cno
		AND course.tno=teacher.tno
		AND teacher.tname='叶平'
	);


/*
6.查询同时学过课程1和课程2的同学的学号、姓名
*/
-- 方法一
SELECT 
	sst.sno AS '学号',
	sst.sname AS '姓名'
FROM
	student sst, sc
WHERE
	sst.sno=sc.sno
	AND sc.cno IN (1,2)
GROUP BY sst.sno
HAVING COUNT(sc.cno)>=2;

-- 方法二
SELECT 
	sst.sno AS '学号',
	sst.sname AS '姓名'
FROM
	student sst
WHERE 
	sno IN 
	(
	SELECT
		a.sno
	FROM
		sc a, sc b
	WHERE a.sno=b.sno AND a.cno=1 AND b.cno=2
	)


/*
7.查询学过“叶平”老师所教所有课程的所有同学的学号、姓名
*/
SELECT 
	sst.sno AS '学号',
	sst.sname AS '姓名'
FROM
	student sst, sc
WHERE
	sst.sno=sc.sno 
	AND sc.cno IN
	(SELECT c.cno FROM course c, teacher t WHERE c.tno=t.tno AND t.tname='叶平')
GROUP BY sst.sno
HAVING COUNT(sc.cno) >= 
	(SELECT COUNT(*) FROM course c, teacher t WHERE c.tno=t.tno AND t.tname='叶平')


/*
8.查询所有课程成绩小于60分的同学的学号、姓名
*/
SELECT 
	sno AS '学号',
	sname AS '姓名'
FROM
	student
WHERE
	sno NOT IN 
	(SELECT sno FROM sc WHERE score>=60)
	

/*
9.查询没有学全所有课的同学的学号、姓名
*/
SELECT 
	sst.sno AS '学号',
	sst.sname AS '姓名'
FROM
	student sst, sc
WHERE
	sst.sno=sc.sno
GROUP BY sst.sno
HAVING COUNT(sc.cno) <
	(SELECT COUNT(*)  FROM course);


/*
10.查询至少有一门课程 与 学号为1的同学所学课程 相同的同学的学号和姓名
*/
SELECT 
	DISTINCT
	sst.sno AS '学号',
	sst.sname AS '姓名'
FROM 
	student sst, sc
WHERE 
	sst.sno=sc.sno
	AND sst.sno!=1
	AND sc.cno IN 
	(SELECT cno FROM sc WHERE sno=1)


/*
11.把“sc”表中“刘老师”所教课的成绩都更改为此课程的平均成绩
*/
?????


/*
12.查询和2号同学学习的课程完全相同的其他同学学号和姓名
TAG:匹配子集,子集全等
*/
SELECT
	student.sno AS '学号',
	student.sname AS '姓名',
	sc.cno,
	cno_2.cno
FROM
	student
LEFT JOIN sc ON student.sno=sc.sno
LEFT JOIN (SELECT cno FROM sc WHERE sno=2) cno_2 ON cno_2.cno=sc.cno
WHERE 
	student.sno !=2
GROUP BY student.sno,student.sname
HAVING COUNT(sc.cno) = (SELECT COUNT(*) FROM sc WHERE sno=2)


/*
13.向sc表中插入一些记录，这些记录要求符合以下条件：
将没有课程3成绩同学的该成绩补齐, 其成绩取所有学生的课程2的平均成绩
TAG:INSERT SELECT
*/
INSERT INTO sc(sno, cno, score)
SELECT DISTINCT sno, 3, (SELECT avg(score) FROM sc WHERE cno=2) AS score FROM sc WHERE sno NOT IN (SELECT sno FROM sc WHERE cno=3)


/*
14.按平平均分从高到低显示所有学生的如下统计报表：
学号,企业管理,马克思,UML,数据库,物理,课程数,平均分
TAG: 除聚集计算语句外，SELECT语句中的每一列都必须在GROUP BY子句中给出。
*/
SELECT 	
	sno AS '学号',
	MAX(case when cno = 1 then score else '-' end) AS '企业管理',
	MAX(case when cno = 2 then score else '-' end) AS '马克思',
	MAX(case when cno = 3 then score else '-' end) AS 'UML',
	MAX(case when cno = 4 then score else '-' end) AS '数据库',
	MAX(case when cno = 5 then score else '-' end) AS '物理',
	COUNT(cno) AS '课程数',
	AVG(score) AS '平均分'
FROM
	sc
GROUP BY sno
ORDER BY avg(score) DESC;


/*
15.查询各科成绩最高分和最低分：以如下形式显示：课程号，最高分，最低分
*/





/*
–19、按各科平均成绩从低到高和及格率的百分数从高到低顺序
*/





/*
–20、查询如下课程平均成绩和及格率的百分数(用”1行”显示): 企业管理（001），马克思（002），UML 
*/





/*
–21、查询不同老师所教不同课程平均分, 从高到低显示
*/



/*
– 张老师 数据库 88
*/





/*
–22、查询如下课程成绩均在第3名到第6名之间的学生的成绩：
*/



/*
– [学生ID],[学生姓名],企业管理,马克思,UML,数据库,平均成绩
*/






/*
–23、统计打印各科成绩,各分数段人数:课程ID,课程名称,[100-85],[85-70],[70-60],[ <60]
*/





/*
–24、查询学生平均分及其名次
*/






/*
–25、查询各科成绩前三名的记录:(不考虑成绩并列情况)
*/






/*
–26、查询每门课程被选修的学生数
*/






/*
–27、查询出只选修了一门课程的全部学生的学号和姓名
*/






/*
–28、查询男生、女生人数
*/






/*
–29、查询姓“张”的学生名单
*/





/*
–30、查询同名同性学生名单，并统计同名人数
*/





/*
–31、1981年出生的学生名单(注：student表中sage列的类型是datetime)
*/





/*
–32、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程号降序排列
*/






/*
–33、查询平均成绩大于80的所有学生的学号、姓名和平均成绩
*/






/*
–34、查询 数据库 分数 低于60的学生姓名和分数
*/






/*
–35、查询所有学生的选课情况
*/






/*
–36、查询成绩在70分以上的学生姓名、课程名称和分数
*/






/*
–37、查询不及格的课程，并按课程号从大到小排列
*/






/*
–38、查询课程编号为3且课程成绩在80分以上的学生的学号和姓名
*/






/*
–39、求选了课程的学生人数
*/





/*
–40、查询选修“叶平”老师所授课程的学生中，成绩最高的学生姓名及其成绩
*/






/*
–41、查询各个课程及相应的选修人数
*/






/*
–42、查询不同课程成绩相同的学生的学号、课程号、学生成绩
*/








/*
–43、查询每门课程成绩最好的前两名的学生ID
*/






/*
–44、统计每门课程的学生选修人数(至少有2人选修的课程才统计)。要求输出课程号和选修人数，
*/



/*
–查询结果按人数降序排列，若人数相同，按课程号升序排列
*/





/*
–45、检索至少选修了5门课程的学生学号
*/




/*
–46、查询全部学生都选修的课程的课程号和课程名
*/






/*
–47、查询没学过“叶平”老师讲授的任一门课程的学生姓名
*/






/*
–48、查询两门以上不及格课程的同学的学号及其平均成绩
*/




/*
–49、检索4号课程分数大于60的同学学号，按分数降序排列
*/





/*
–50、删除2号同学的课程1的成绩
*/







/*
–43.查询各单科状元
*/



/*
–46.查询最受欢迎的课程(选修学生最多的课程)
*/



/*
–xx.查询成绩最好的课程
*/



/*
–xx.查询最受欢迎的老师(选修学生最多的老师)
*/



/*
–xx.查询教学质量最好的老师
*/



/*
–xx.查询需要补考的各科学生清单*
*/




 



