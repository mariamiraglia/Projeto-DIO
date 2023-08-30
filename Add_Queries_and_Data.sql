use ecommerce;

-- show tables;
-- idCliente, cNome,Sobrenome,CPF_CNPJ,Endereço

insert into cliente (cNome, Sobrenome, CPF_CNPJ, Endereço) 
	   values('Maria','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');
             
 select * from cliente;
 
-- desc produto;
-- prNome,Classificação_kids,prCategoria,Avaliação,Tamanho, Valor

insert into produto(prNome,Classificação_kids,prCategoria,Avaliação,Tamanho, Valor) 
	values  ('Fone de ouvido',false,'Eletrônico','4',null,350.00),
			('Barbie Elsa',true,'Brinquedos','3',null,90.00),
			('Body Carters',true,'Vestimenta','5',null,149.99),
			('Microfone Vedo - Youtuber',False,'Eletrônico','4',null,450.50),
			('Sofá retrátil',False,'Móveis','3','3x57x80',1500.00),
			('Farinha de arroz',False,'Alimentos','2',null,27.90),
			('Fire Stick Amazon',False,'Eletrônico','3',null,120.40);
            
select * from produto;

-- desc pedido;

-- idPedidoCliente, pdStatus, pdDescription, pdCarência, valor_Total_pedido
-- delete from pedido where idPedidoCliente in  (1,2,3,4);
insert into pedido (idPedidoCliente, pdStatus, pdDescription, pdCarência, valor_Total_pedido)
	values  (1, default,'compra via aplicativo',null,159.99),
			(2,default,'compra via aplicativo',null,37.45),
			(3,'Confirmado',null,null,978.56),
			(4,default,'compra via web site',"2023-01-04",15.99);

select * from pedido;

-- desc pagamento;

-- pgTipo, pgStatus, valor_Total, pgVencimento
-- delete from pagamento where idPedido in (1,2,3,4);
insert into pagamento(idCliente, idPedido,idPagamento,pgTipo, pgStatus, valor_Total, pgVencimento)
	values  (1,1,1,"Pix","Aprovado",159.99,"2023-12-25"),
			(2,2,2,"Cartão",default,37.45,"2023-03-01"),
			(3,3,3,"Boleto",default,978.56,"2023-04-25"),
			(4,4,4,"Boleto","Recusado",15.99,"2023-01-04");
            
select * from pagamento;

-- desc entrega;
-- idPedidoEntrega, etPrazo, Frete, etStatus

insert into entrega(idPedidoEntrega, etPrazo, Frete, etStatus)
	values  (1,"15 dias",2.99,"No caminho"),
			(2,"4 dias",default,"Entregue"),
			(3,"20 dias",25.40,"Em processamento"),
			(4,"2 dias",default,"No caminho");
            
select * from entrega;

-- desc estoque;
-- idEstoque, esLocal

insert into estoque(esLocal)
	values  ("Brasília-DF"),
			("São Luís-MA"),
			("Campinas-SP");
			
select * from estoque;
-- desc fornecedor;            
-- idFornecedor, fnRazãoSocial, fnCNPJ(14)

 insert into fornecedor(idFornecedor, fnRazãoSocial, fnCNPJ)
	values  (1,"Almeida e Filhos","98624308153763"),
			(2,"Eletrônicos Lucas","12345678909875"),
			(3,"Fornecemos doces","34091564097520");           

select * from fornecedor;

-- desc vendedor;
-- idVendedor, vnRazãoSocial, vnLocal

  insert into vendedor(vnRazãoSocial, vnLocal)
	values  ("Vendinha do Aspas", "São Paulo-SP"),
			("Pancada neles", "Brasília-DF"),
			("Loja Dois Irmãos", "São Luís-MA");  
            
select * from vendedor;

-- desc produtoPedido;
-- idPPproduto, idPPpedido, ppQuantidade, ppStatus

insert into produtoPedido (idPPproduto, idPPpedido, ppQuantidade, ppStatus)
	values  (1, 1, 3, default),
			(2, 4, 9, default),
			(3, 1, 1, default),
			(4, 2, 0, "Indisponível no momento" );

select * from produtoPedido;
            
-- desc produtoVendedor;
-- idPVproduto, idPVvendedor, Quantidade_por_vendedor

 insert into produtoVendedor(idPVproduto, idPVvendedor, Quantidade_por_vendedor)
	values  (1, 2, 7),
			(2, 2, 2),
			(3, 2, 2),
            (4, 3, 13);

select * from produtoVendedor;

-- desc produtoFornecedor;
-- idPFproduto, idPFfornecedor, Quantidade_fornecedor         

insert into produtoFornecedor(idPFproduto, idPFfornecedor, Quantidade_fornecedor      )
	values  (1, 2, 500),
			(2, 2, 29),
			(4, 2, 346),
            (1, 1, 149),
            (3, 3, 321);    

select * from produtoFornecedor;

-- desc produtoEstoque;
-- idPEproduto, idPEestoque, Quantidade_disponível

 insert into produtoEstoque(idPEproduto, idPEestoque, Quantidade_disponível)
	values  (3, 2, 34),
			(4, 2, 86),
			(2, 3, 456),
            (1, 1, 123);
            
select * from produtoEstoque;

-- contar quantos clientes 
select count(*) from cliente;

-- associar o pedido ao cliente
select * from cliente c, pedido pd  where c.idCliente = idPedidoCliente;



