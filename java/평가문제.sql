--1. 사원 테이블과 부서 테이블에서 사원 번호와 사원 이름, 소속부서 번호,
--소속부서 이름을 출력하도록 표준 inner join 코드를 생성하세요

select e.empno 사번, e.ename 이름,
       e.deptno 부서번호, d.dname 부서명
from emp e inner join dept d
on e.deptno = d.deptno;

--2. 사원 테이블과 부서 테이블에서 사원 번호와 사원이름, 소속부서 번호와
--소속부서 이름을 출력하도록 natural join 코드를 생성하세요.

select e.empno 사번, e.ename 이름,
       deptno, d.dname 부서명
from emp e natural join dept d; 

--3. Player 테이블에서 정남일 선수 소속팀의 선수들에 대한 선수명, 포지션,
--백넘버를 출력하는 서브쿼리를 작성하세요. 선수이름으로 오름차순 정렬

select player_name 선수명, position 포지션, back_no 백넘버
from player
where team_id =
(select team_id
from player
where player_name = '정남일')
order by player_name asc;

--4. 선수들 중에서 키가 평균 이하인 선수들의 선수명, 포지션, 백넘버를
--출력하는 서브쿼리를 작성하세요. 선수이름 오름차순 정렬

select player_name 선수명, position 포지션, back_no 백넘버
from player
where height <=
(select avg(height)
from player)
order by player_name asc;


--5. 선수테이블과 팀테이블을 조인하여, 선수 자신이 속한 팀의 평균 키보다
--작은 선수들의 정보를 출력하는 연관 서브쿼리를 작성하세요.
--선수명으로 오름차순 정렬

select p.player_name 선수명, t.team_name 팀, p.position 포지션,
       p.back_no 백넘버, p. height 키
from player p, team t
where p.team_id = t.team_id
and p.height < (
    select avg(pp.height)
    from player pp
    where pp.team_id = p.team_id
    group by pp.team_id
    )
order by p.player_name asc;


--6. 부서명과 업무명을 기준으로 사원수와 급여 합을 GROUP BY SQL 문장을
--생성하세요, 부서, 업부별 오름차순정렬

select d.dname, e.job, count(*) 사원수, sum(e.sal) 급여합계
from dept d, emp e
where d.deptno = e.deptno
group by d.dname, e.job
order by d.dname asc, e.job asc;

--7. 부서명과 업무명을 기준으로 집계한 일반적인 GROUP BY SQL 문장에
--ROLLUP 함수를 사용하여 사원수와 급여합계에 대한 소계를 출력하세요
--부서, 업무별로 오름차순 정렬

select d.dname, e.job, count(*) 사원수, sum(e.sal) 급여합계
from dept d, emp e
where d.deptno = e.deptno
group by rollup (d.dname, e.job)
order by d.dname asc, e.job asc;

--8. 사원 'JONES'인 직속상사인 사원번호, 사원이름, 직속상사번호를 조회하는
--셀프조인을 작성하세요.
--관리자(MGR)가 'JONES'의 EMPNO인 행 조회

select b.empno, b.ename, b.mgr
from emp a, emp b
where a.ename = 'JONES'
and b.mgr = a.empno;

--9. 홍길동 선수를 INSERT하려고 할때 PLAYER_ID값은 기존 최대값에 + 1을 더한 값으로
--넣고자 합니다. VALUES절에 서브쿼리를 사용해 SQL을 작성하세요.

insert into player(player_id, player_name, team_id)
values ((select to_char(max(to_number(player_id))+1) from player),
        '홍길동','K01');

--10. 선수 테이블의 포지션이 NULL인 선수들의 포지션을 ‘MF’로 수정하세요.

update player
set position = 'MF'
where position is NULL;