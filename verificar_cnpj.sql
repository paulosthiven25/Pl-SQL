CREATE OR REPLACE FUNCTION verificarCNPJ
(v_cnpj in varchar2)
return number
is
v_soma number;
v_divisao number;

v_validacao BOOLEAN :=false;
type peso1 IS VARRAY(12) OF number; 
v_array1 peso1 := peso1(5,4,3,2,9,8,7,6,5,4,3,2);

type peso2 IS VARRAY(13) OF number; 
v_array2 peso2 := peso2(6,5,4,3,2,9,8,7,6,5,4,3,2);

begin
v_soma := 0;

for i in 1..12 loop
   
    v_soma := v_soma + SUBSTR(v_cnpj,i,1) * v_array1(i);
  
end loop;
v_divisao := MOD(v_soma,11);
return v_soma;

--IF(v_divisao = 0)then
--return 'RG válido';
--else
--return 'RG inválido';
--end if;
end;
/
