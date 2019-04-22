declare
v_cpf VARCHAR2 :=&pcpf;
v_soma number;
v_resto  number;
v_validacao boolean:=false;

begin
v_soma :=0;
if(v_cpf='00000000000')then
v_validacao :=false;
end if;

for i IN 1..9 LOOP
   v_soma:=v_soma + SUBSTR(v_cpf,i-1, i) * (11-1);
  END LOOP;


end;
/