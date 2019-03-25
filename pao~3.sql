begin
update employees
set salary=salary *0.1
where department_id=50;

dbms_output.put_line('Quantidade de salarios atualizados' ||SQL%ROWCOUNT);
ROLLBACK;
end;
/