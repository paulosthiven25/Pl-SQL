drop sequence DEPARTMENTS_SEQ;
CREATE SEQUENCE DEPARTMENTS_SEQ START WITH 1000;
CREATE PROCEDURE add_department(
    name VARCHAR2, mgr NUMBER, loc NUMBER) IS
BEGIN
  INSERT INTO DEPARTMENTS (department_id,
    department_name, manager_id, location_id)
  VALUES (DEPARTMENTS_SEQ.NEXTVAL, name, mgr, loc);
  DBMS_OUTPUT.PUT_LINE('Added Dept: '||name);
EXCEPTION
 WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Err: adding dept: '||name);
END;
/

CREATE PROCEDURE create_departments IS
BEGIN
  add_department('Media', 100, 1800);
  add_department('Editing', 99, 1800);
  add_department('Advertising', 101, 1800);
END;
/
EXEC create_departments;
select * from departMENTS WHERE DEPARTMENT_ID >=1000;
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN (99,100,101);