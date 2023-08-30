-- criar o banco de dados
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente

CREATE TABLE cliente(
	idCliente INT auto_increment PRIMARY KEY,
    cNome VARCHAR(20),
    Sobrenome VARCHAR(20),
    CPF_CNPJ VARCHAR(14) not null,
    Endereço VARCHAR(100),
    CONSTRAINT unique_client_cpf_cnpj UNIQUE (CPF_CNPJ)
);



alter table cliente auto_increment = 1;
desc cliente;

-- criar tabela produto 

CREATE TABLE produto(
	idProduto INT auto_increment PRIMARY KEY,
    prNome VARCHAR(50) not null,
    Classificação_kids BOOL default FALSE,
    prCategoria ENUM("Eletrônico","Vestimenta","Brinquedos","Alimentos","Móveis") not null,
    Avaliação FLOAT default 0,
    Tamanho VARCHAR(10),
    Valor FLOAT 
);
alter table produto auto_increment = 1;

-- criar tabela pedido

CREATE TABLE pedido(
	idPedido INT auto_increment PRIMARY KEY not null,
    idPedidoCliente INT,
    pdStatus ENUM("Cancelado","Confirmado","Em processamento") default "Em processamento",
    pdDescription VARCHAR(300),
    pdCarência VARCHAR(45),
    valor_Total_pedido FLOAT,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idPedidoCliente) references cliente(idCliente)    
);
alter table pedido auto_increment = 1;
-- criar tabela pagamento

CREATE TABLE pagamento(
	idCliente INT not null,
    idPagamento INT,
    idPedido INT not null,
    pgTipo ENUM ("Boleto", "Cartão", "Pix") not null,
    pgStatus ENUM ("Em análise", "Aprovado","Recusado") default "Em análise",
    valor_Total FLOAT,
    pgVencimento DATE,
    PRIMARY KEY(idCliente, idPagamento),
    CONSTRAINT fk_pedido_pagamento FOREIGN KEY(idPedido) references pedido(idPedido) 
			on update CASCADE,
    CONSTRAINT fk_cliente_pagamento FOREIGN KEY (idCliente) references cliente(idCliente) 
			on update CASCADE
);

-- criar tabela entrega 

CREATE TABLE entrega(
	idEntrega INT auto_increment PRIMARY KEY,
    idPedidoEntrega INT,
    etPrazo VARCHAR(45),
    Frete FLOAT default 0,
    etStatus ENUM ("Em processamento", "No caminho", "Entregue"),
    CONSTRAINT fk_pedido_entrega FOREIGN KEY(idPedidoEntrega) references pedido(idPedido)
);
alter table entrega auto_increment = 1;

-- criar tabela estoque

CREATE TABLE estoque(
	idEstoque INT auto_increment PRiMARY KEY,
	esLocal VARCHAR(45)
);

alter table estoque auto_increment = 1;

-- criar tabela fornecedor

CREATE TABLE fornecedor(
	idFornecedor INT PRIMARY KEY,
    fnRazãoSocial VARCHAR(45),
    fnCNPJ VARCHAR(14)
);

-- criar a tabela vendedor 

CREATE TABLE vendedor(
	idVendedor INT auto_increment PRIMARY KEY,
    vnRazãoSocial VARCHAR(45),
    vnLocal VARCHAR(45)
);


-- criar tabela relação produto-pedido

CREATE TABLE produtoPedido(
	idPPproduto INT,
    idPPpedido INT,
    ppQuantidade INT default 1,
    ppStatus ENUM("Disponível", "Indisponível no momento") default "Disponível",
    PRIMARY KEY (idPPproduto, idPPpedido),
    CONSTRAINT fk_produtoPedido_produto FOREIGN KEY(idPPproduto) references produto(idProduto), 
    CONSTRAINT fk_produtoPedido FOREIGN KEY(idPPpedido) references pedido(idPedido)
);

-- criar tabela relação produto-vendedor

CREATE TABLE produtoVendedor(
	idPVproduto INT,
    idPVvendedor INT,
    Quantidade_por_vendedor INT,
    PRIMARY KEY(idPVproduto, idPVvendedor),
    CONSTRAINT fk_produtoVendedor_produto FOREIGN KEY (idPVproduto) references produto(idProduto),
    CONSTRAINT fk_produtoVendedor_vendedor FOREIGN KEY (idPVvendedor) references vendedor(idVendedor)
);

-- criar tabela relação produto-fornecedor

CREATE TABLE produtoFornecedor(
	idPFproduto INT,
    idPFfornecedor INT,
    Quantidade_fornecedor INT,
    PRIMARY KEY(idPFproduto, idPFfornecedor),
    CONSTRAINT fk_produtoFornecedor_produto FOREIGN KEY (idPFproduto) references produto(idProduto),
    CONSTRAINT fk_produtoFornecedor_fornecedor FOREIGN KEY (idPFfornecedor) references fornecedor(idFornecedor)
);


-- criar tabela relação produto-estoque

CREATE TABLE produtoEstoque(
	idPEproduto INT,
    idPEestoque INT,
    Quantidade_disponível INT,
    PRIMARY KEY(idPEproduto, idPEestoque),
    CONSTRAINT fk_produtoEstoque_produto FOREIGN KEY (idPEproduto) references produto(idProduto),
    CONSTRAINT fk_produtoEstoque_estoque FOREIGN KEY (idPEestoque) references estoque(idEstoque)
);

show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';