CREATE or REPLACE PROCEDURE atualizar_estoque
(produto in number,qtde_add in number) 
      IS
      v_contador NUMBER;
BEGIN
          select count(*) into v_contador from t_est_estoque where cd_produto = produto;
          if v_contador > 0 THEN
          UPDATE t_est_estoque SET qt_estoque= qt_estoque + qtde_add
        WHERE  cd_produto=produto;
    ELSE
        INSERT INTO t_est_estoque values (SEQ_ESTOQUE.nextval,produto, qtde_add);
    END IF;
END;
      