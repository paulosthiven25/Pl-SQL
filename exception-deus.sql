declare
V_ERROM VARCHAR(100);
v_salario employees.SALARY%TYPE := &p_salario;
v_last_name  employees.LAST_NAME%TYPE;



BEGIN
select LAST_NAME INTO v_last_name FROM EMPLOYEES WHERE SALARY = v_salario;

EXCEPTION
when TOO_MANY_ROWS THEN 
V_ERROM := SQLERRM;
insert into messages values(V_ERROM);

WHEN NO_DATA_FOUND THEN
V_ERROM := 'No employee with a salary of'|| v_salario;
insert into messages values(V_ERROM);    
end;
/


SELECT * FROM MESSAGES;
