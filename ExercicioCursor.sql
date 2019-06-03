TRUNCATE TABLE  top_dogs;
CREATE TABLE top_dogs
(name VARCHAR2(25),
salary NUMBER(11,2));
ACCEPT p_rank PROMPT 'Digite um numero para o tamnho do rank de salários: '
DECLARE 
v_rank number:=to_number(&p_rank);
CURSOR cur_pao IS
SELECT SALARY,LAST_NAME FROM EMPLOYEES WHERE ROWNUM <=v_rank
ORDER BY SALARY DESC;
rec_pao cur_pao%ROWTYPE;
BEGIN
--FOR rec_pao in cur_pao loop
--INSERT INTO top_dogs VALUES(rec_pao.LAST_NAME,rec_pao.SALARY);
--end loop;
OPEN cur_pao;
FETCH cur_pao INTO rec_pao;
WHILE cur_pao%ROWCOUNT <= v_rank AND emp_cursor%found LOOP
INSERT INTO top_dogs VALUES(rec_pao.LAST_NAME,rec_pao.SALARY);
FETCH cur_pao INTO rec_pao;
END LOOP;
CLOSE cur_pao;
END;
/
