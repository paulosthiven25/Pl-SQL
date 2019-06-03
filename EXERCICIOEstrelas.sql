drop table emp;
create table emp
as select * from employees;
alter table emp
add stars varchar(50);

ACCEPT p_empno PROMPT 'Informe o número do funcionário: '
set autoprint on
DECLARE

--variavel que armazena o id passado e é usado para saber em qual empregado dar select e update
v_employee EMPLOYEES.EMPLOYEE_ID%TYPE := TO_NUMBER(&p_empno);
--variavel que vai conter os ateriscos.Ele vai ser iterado dependendo do valor do select
v_asterisco EMP.STARS%TYPE:=null;
--variavel q guarda o valor do select,usado pra ver quantos asteriscos vao ser criados
v_sal emp.salary%TYPE;

counter number:=1;

BEGIN
--select que busca o valor do salario/1000 de um empregado especifico
SELECT nvl(trunc(E.SALARY/1000),0) INTO v_sal FROM EMPLOYEES E WHERE E.EMPLOYEE_ID = v_employee;
--loop onde a variavel v_asterisco é iterada
--FOR I IN 1..v_sal loop
WHILE counter<=v_sal loop
v_asterisco:=v_asterisco||'*';
counter:=counter+1;
END LOOP;
--update na tabela EMP ,ATUALIZANDO o empreagado especifico,passndo o v_asterisco no set
UPDATE EMP e SET STARS = v_asterisco where EMPLOYEE_ID=v_employee;
END;
/