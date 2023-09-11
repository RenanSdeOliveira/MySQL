CREATE VIEW `cliente-view` AS
select idCliente from cliente where idCliente != 0 order by idCliente asc;

CREATE VIEW `estoque-view` AS
select * from estoque where idEstoque != 0 order by idEstoque desc;

CREATE VIEW `pedido-view` AS
select * from pedido where Status = "Aprovado" order by Status asc;


