set SERVEROUTPUT ON
accept p_id prompt 'Informe o id do funcionario'
accept p_percent prompt 'Informe a porcentagem de aumento'


create or replace procedure aumento(
p_id IN EMPLOYEES.SALARY%TYPE,
p_percent IN number
)
IS
v_percent EMPLOYEES.SALARY%TYPE := p_percent;
v_id EMPLOYEES.EMPLOYEE_ID%TYPE := p_id;

e_usuario_n_existe EXCEPTION;
begin
Update EMPLOYEES 
SET SALARY  = SALARY * (1+v_percent/100)
WHERE EMPLOYEE_ID = v_id;

if SQL%NOTFOUND THEN

RAISE e_usuario_n_existe;
END IF;

EXCEPTION
WHEN e_usuario_n_existe THEN
DBMS_OUTPUT.PUT_LINE('o empregado não existe');

end;
/
exec aumento(1000,50);