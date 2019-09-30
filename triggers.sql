CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON employees BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN','MON')) OR
     (TO_CHAR(SYSDATE,'HH24:MI') 										  NOT BETWEEN '12:00' AND '18:00') THEN
  RAISE_APPLICATION_ERROR(-20500,user||' '||sys_context('userenv','IP_ADDRESS')||' '||sys_context('userenv','host')|| ' You may insert'||' into EMPLOYEES table only during ' ||' business hours.');
  END IF;
END;

insert into employees values(2,null,'Zé','a',null,sysdate,'AD_PRES',null,null,110,10);

create table audit_emp
( username varchar(100),
time_stamp date,
id number(5),
old_last_name varchar(50),
new_last_name varchar(50),
old_title varchar(10),
new_title varchar(10),
old_salary number(7,2),
new_salary number(7,2));

CREATE OR REPLACE TRIGGER audit_emp_values
AFTER DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO audit_emp(username, time_stamp, id,
    old_last_name, new_last_name, old_title,
    new_title, old_salary, new_salary)
  VALUES (USER, SYSDATE, :OLD.employee_id,
    :OLD.last_name, :NEW.last_name, :OLD.job_id,
    :NEW.job_id, :OLD.salary, :NEW.salary);
END;
/
select * from audit_emp;
update employees
set salary=10000 where employee_id=150;
delete from employees
where employee_id=107;
alter trigger secure_emp disable;