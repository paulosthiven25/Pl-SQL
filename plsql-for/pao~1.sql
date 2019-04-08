set verify off

accept p_id prompt 'Informe o número de funcionarios ?'
drop table emp;
create table emp
as select * from employees;
alter table emp
add stars varchar(50);

set serveroutput on
declare
v_eid emp.employee_id%type :=&p_id;
v_sal emp.salary%type;
v_stars EMP.STARS%type ;

begin
select round(salary/1000) into v_sal from EMPLOYEES where employee_id = v_eid;

for i in 1..v_sal loop
v_stars:=v_stars||'*';

end loop;
DBMS_OUTPUT.PUT_line(length(v_stars));

end;
/


