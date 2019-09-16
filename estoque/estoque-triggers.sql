Create or replace trigger trg_entrada_produto
after insert or UPDATE or delete on t_est_entrada
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
begin

IF inserting THEN 
atualizar_estoque(:new.CD_PRODUTO,:new.QT_PRODUTO);
end if;
 
 if UPDATING then
atualizar_estoque(:new.CD_PRODUTO,:new.QT_PRODUTO - :old.QT_PRODUTO);
end if;

if DELETING then
atualizar_estoque(:old.CD_PRODUTO,:old.QT_PRODUTO * -1);
end if;

end;
/

desc t_est_entrada
Create or replace trigger trg_saida_produto
after insert or UPDATE or delete on t_est_saida
REFERENCING OLD AS old NEW AS new
FOR EACH ROW
begin

IF inserting THEN 
atualizar_estoque(:new.CD_PRODUTO,:new.qt_estoque);
end if;
 
 if UPDATING then
atualizar_estoque(:new.CD_PRODUTO,:new.qt_estoque - :old.qt_estoque);
end if;

if DELETING then
atualizar_estoque(:old.CD_PRODUTO,:old.qt_estoque * -1);
end if;

end;
/