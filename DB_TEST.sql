CREATE TABLE DEPT (
    DEPTNO DECIMAL(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13),
    CONSTRAINT PK_DEPT PRIMARY KEY (DEPTNO) 
);
CREATE TABLE EMP (
    EMPNO DECIMAL(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR DECIMAL(4),
    HIREDATE DATE,
    SAL DECIMAL(7,2),
    COMM DECIMAL(7,2),
    DEPTNO DECIMAL(2),
    CONSTRAINT PK_EMP PRIMARY KEY (EMPNO),
    CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);
CREATE TABLE SALGRADE ( 
    GRADE INT,
    LOSAL INT,
    HISAL INT 
);
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,TO_DATE('17-12-1980','DD-MM-YYYY'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('20-2-1981','DD-MM-YYYY'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('22-2-1981','DD-MM-YYYY'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,TO_DATE('2-4-1981','DD-MM-YYYY'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,TO_DATE('28-9-1981','DD-MM-YYYY'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,TO_DATE('1-5-1981','DD-MM-YYYY'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,TO_DATE('9-6-1981','DD-MM-YYYY'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,TO_DATE('13-7-1987','DD-MM-YYYY')-85,3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,TO_DATE('17-11-1981','DD-MM-YYYY'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,TO_DATE('8-9-1981','DD-MM-YYYY'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,TO_DATE('13-7-1987', 'DD-MM-YYYY'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,TO_DATE('3-12-1981','DD-MM-YYYY'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,TO_DATE('3-12-1981','DD-MM-YYYY'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,TO_DATE('23-1-1982','DD-MM-YYYY'),1300,NULL,10);
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;


1. 사원 테이블의 모든 레코드를 조회하시오.
    select * 
    from emp
2. 사원명과 입사일을 조회하시오
    select ename, HIREDATE
    from emp
3. 사원번호와 이름을 조회하시오.
    select empno, ename
    from emp
4. 사원테이블에 있는 직책의 목록을 조회하시오.
    select job
    from emp
5. 총 사원수를 구하시오.
    select count(ename)
    from emp
6. 부서번호가 10인 사원을 조회하시오.
    select ename
    from emp
    where deptno = 10
7. 월급여가 2500이상 되는 사원을 조회하시오.
    select ename
    from emp 
    where SAL >= 2500

8. 이름이 'KING'인 사원을 조회하시오.
    select ename
    from emp
    where ename ='KING'

9. 사원들 중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오./*Like문*/
    select empno, ename
    from emp 
    where ename Like 'S%'
10. 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오.
    select empno, ename
    from emp 
    where ename Like '%T%'
11. 커미션이 300, 500, 1400 인 사원의 사번,이름,커미션을 조회하시오.
    select empno, ename,COMM
    from emp
    where COMM=300 or comm = 500 or comm = 1400
12. 월급여가 1200 에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오.
    select empno, ename, sal
    from emp
    where sal >= 1200 and sal <= 3500 
13. 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오.
    select ename, empno,job,deptno
    from emp
    where job = 'MANAGER' and deptno = 30 /*AND = 이거 랑 이거///OR = 이거 아님 이거 */ 
14. 부서번호가 30인 아닌 사원의 사번,이름,부서번호를 조회하시오.
    select ename,empno,deptno
    from emp
    where deptno != 30 
15. 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오.
    select empno,ename,comm
    from emp
    where comm != 300 and comm!=500 and comm!= 1400 or comm IS NULL

16. 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오.
    select empno, ename
    from emp 
    where ename not LIKE '%S%'

17. 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오.
    select empno, ename , sal
    from emp
    where sal < 1200 or sal > 3700

18. 직속상사가 NULL 인 사원의 이름과 직급을 조회하시오.
    select ename, job
    from emp
    where MGR IS NULL
    
19. 부서별 평균월급여를 구하는 쿼리
    select deptno,avg(sal)
    from emp
    GROUP BY DEPTNO
    

20. 부서별 전체 사원수와 커미션을 받는 사원들의 수를 구하는 쿼리
    select deptno, count(ename),count(comm)
    from emp
    Group by deptno
     
21. 부서별 최대 급여와 최소 급여를 구하는 쿼리
    select deptno, max(sal),min(sal)
    from emp 
    Group by deptno

22. 부서별로 급여 평균 (단, 부서별 급여 평균이 2000 이상만)
    select deptno, avg(sal)
    from emp
    Group by deptno
    having avg(sal) >= 2000

23. 월급여가 1000 이상인 사원만을 대상으로 부서별로 월급여 평균을 구하라. 단, 평균값이 2000 이상인 레코드만 구하라.
    select deptno, avg(sal)
    from emp
    where sal >= 2000
    GROUP BY DEPTNO
24. 급여가 높은 순으로 조회하되 급여가 같을 경우 이름의 철자가 빠른 사원순으로 사번,이름,월급여를 조회하시오.
    select empno, ename, sal
    from emp
    order by sal desc, ename

/////////////// 조인(두테이블이상)
25. 사원명과 부서명을 조회하시오.
    select ename, dname
    from emp, dept
    where emp.deptno = dept.deptno;


26. 이름, 월급여, 월급여 등급을 조회하시오.
    select a.ename, a.sal, b.grade
    from emp a, salgrade b
    where a.sal>=b.LOSAL and a.sal<=b.HISAL;

27. 이름, 부서명, 월급여등급을 조회하시오
    select a.ename, c.dname, b.grade
    from emp a, salgrade b, dept c
    Where a.deptno = c.deptno and a.sal>=b.LOSAL and a.sal<=b.HISAL;
      
28. 이름, 직속상사 이름을 조회하시오.
    select a.ename, b.ename
    from emp a, emp b
    Where a.MGR = b.empno

29. 이름, 부서번호, 부서이름을 조회하시오.
     select a.ename, b.deptno, b.dname
    from emp a, dept b
    Where a.deptno = b.deptno;

30. 부서번호가 30번인 사원들의 이름, 직급, 부서번호, 부서위치를 조회하시오.
    select a.ename, a.job, a.deptno,b.loc
    from emp a, dept b
    where a.deptno = 30 and a.deptno = b.deptno;

31. 커미션이 NULL이 아닌 사원의 이름, 커미션, 부서이름, 부서위치를 조회하시오.
    select a.ename, a.comm, b.dname, b.loc
    from emp a, dept b
    where a.comm is not null and a.deptno = b.deptno;

32. DALLAS에서 근무하는 사원의 이름, 직급, 부서번호, 부서명을 조회하시오.
    select a.ename, a.job, a.deptno, b.dname
    from emp a, dept b
    where b.loc Like 'DALLAS';
33. 이름에 A가 들어가는 사원의 이름, 부서명을 조회하시오.
    select a.ename, b.dname
    from emp a, dept b
    where a.ename Like '%A%';

34. 이름, 직급, 월급여, 월급여등급을 조회하시오.
    select a.ename, a.job, a.sal, b.grade
    from emp a,SALGRADE b
    
35. ALLEN과 같은 부서에 근무하는 사원의 이름, 부서번호를 조회하시오.
    select ename, deptno
    from emp
    where DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='ALLEN');