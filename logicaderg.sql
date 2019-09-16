CREATE OR REPLACE FUNCTION verificarRG
(v_rg in varchar2)
return VARCHAR2
is
v_soma number;
v_divisao number;
v_peso number;
begin
v_soma := 0;
v_peso :=2;
for i in 1..9 loop
    if(i=9) then
        v_soma := v_soma + SUBSTR(v_rg,i,1) * 100;
        exit;
    end if;
    v_soma := v_soma + SUBSTR(v_rg,i,1) * v_peso;
    v_peso := v_peso + 1;
end loop;
v_divisao := MOD(v_soma,11);

IF(v_divisao = 0)then
return 'RG válido';
else
return 'RG inválido';
end if;
end;
/


