drop table  t_est_entrada;
drop table  t_est_estoque;
drop table  t_est_saida;
drop table  t_est_produto;
CREATE TABLE t_est_entrada (
    cd_entrada   NUMBER NOT NULL,
    qt_produto   NUMBER NOT NULL,
    dt_entrada   DATE NOT NULL,
    cd_produto   NUMBER NOT NULL
);

ALTER TABLE t_est_entrada ADD CONSTRAINT t_est_entrada_pk PRIMARY KEY ( cd_entrada );

CREATE TABLE t_est_estoque (
    cd_estoque   NUMBER NOT NULL,
    cd_produto   NUMBER NOT NULL,
    qt_estoque   NUMBER NOT NULL
);

ALTER TABLE t_est_estoque ADD CONSTRAINT t_est_estoque_pk PRIMARY KEY ( cd_estoque );

CREATE TABLE t_est_produto (
    cd_prod   NUMBER NOT NULL,
    tp_status    VARCHAR2(50) 
     NOT NULL,
    ds_cor       VARCHAR2(50) 
     NOT NULL
);

ALTER TABLE t_est_produto ADD CONSTRAINT t_est_produto_pk PRIMARY KEY ( cd_prod );

CREATE TABLE t_est_saida (
    cd_saida     NUMBER NOT NULL,
    cd_produto   NUMBER NOT NULL,
    qt_saida     NUMBER NOT NULL,
    dt_saida     NUMBER NOT NULL
);

ALTER TABLE t_est_saida ADD CONSTRAINT t_est_saida_pk PRIMARY KEY ( cd_saida );

