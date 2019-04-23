SET SERVEROUTPUT ON
declare
v_cpf VARCHAR2(11) :=&pcpf;
v_soma number;
v_resto1  number;
v_resto2  number;
v_validacao1 boolean:=false;
v_validacao2 boolean:=false;

begin
v_soma :=0;
if(v_cpf='00000000000')then
v_validacao1 :=false;
v_validacao2 :=false;
end if;

for i IN 1..9 LOOP
   v_soma:=v_soma + SUBSTR(v_cpf,i, i) * (11-i);
    END LOOP;
 v_resto1 :=mod(v_soma*10,11);
dbms_output.put_line(v_resto1);
 
 if((v_resto1=10) or (v_resto1=11))then
 v_resto1:=0;
end if;

 if(v_resto1 = SUBSTR(v_cpf,10,10))then
v_validacao1 :=true;
end if;

v_soma:=0;

for i IN 1..10 LOOP
   v_soma:=v_soma + SUBSTR(v_cpf,i, i) * (12-i);
    END LOOP;
 v_resto2 :=mod(v_soma*10,11);
 dbms_output.put_line(v_resto2);
 if((v_resto2=10) or (v_resto2=11))then
 v_resto2:=0;
end if;

 if(v_resto2 = SUBSTR(v_cpf,11,11))then
v_validacao2 :=true;
end if;

if((v_validacao1 = true) and (v_validacao2=true))then
dbms_output.put_line('Cpf válido');
else
dbms_output.put_line('Cpf inválido');
end if;
end;
/
