SET SERVEROUTPUT ON
declare
v_cpf VARCHAR2(11) :=&pcpf;
v_soma number;
v_resto number;
v_validacao boolean:=false;
v_x number;

begin
v_soma :=0;
if(v_cpf='00000000000')then
v_validacao:=false;  --34317039095

end if;

for i IN 1..9 LOOP
   v_soma:=v_soma + SUBSTR(v_cpf,i,1) * (11-i);
    END LOOP;
 v_resto :=mod(v_soma*10,11);


 if((v_resto=10) or (v_resto=11))then
 v_resto:=0;
end if;

 if(v_resto = SUBSTR(v_cpf,10,1))then
v_validacao :=true;

end if;

v_soma:=0;
v_resto:=0;

for i IN 1..10 LOOP
   v_soma:=v_soma + SUBSTR(v_cpf,i, 1) * (12-i);
    END LOOP;
 v_resto :=mod(v_soma*10,11);

 if((v_resto=10) or (v_resto=11))then
 v_resto:=0;
end if;

 if(v_resto = SUBSTR(v_cpf,11,1))then
v_validacao :=true;
else
v_validacao :=false;
end if;


if(v_validacao) then
dbms_output.put_line('Cpf válido');
else
dbms_output.put_line('Cpf inválido');
end if;
end;
/
