-- CRIAÇAO DO BANDO DE DADOS PARA O CENARIO DE ECOMMERCE
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- CRIANDO A PRIMEIRA TABELA: CLIENTES
 create table clients( 
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char (11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF)   
);
-- APÓS A CRIAÇÃO DA TABELA EXECUTAR A FUNÇÃO "DESC CLIENTS" PARA MOSTRAR TODOS OS ATRIBUTOS.
-- OBS: É SUGESTIVO REALIZAR O MESMO PARA TODAS A OUTRAS TABELAS.
desc clients;

-- CRIANDO A TABELA: PRODUTO
create table product( 
	idProduct int auto_increment primary key,
    Pname varchar(100) not null,
    Classification_kids bool default false,
    Category enum('Eletrônico', 'Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    Avaliação float default 0,
    Size varchar(10)
);

-- CRIANDO A TABELA: PEDIDO

create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em Processamento') default 'Em Processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderCLient) references clients(idClient)
	on update cascade
    );
desc orders;

-- CRIANDO TABELA: ESTOQUE
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar (255),
    quantity int default 0    
);
desc productStorage;

-- CRIANDO TABELA FORNECEDOR
create table supplier(
idSupplier int auto_increment primary key,
SocialName varchar (255) not null,
CNPJ char (15) not null,
contact char(11) not null,
constraint unique_supplier unique (CNPJ)
);
desc supplier;

-- CRIANDO TABELA VENDEDOR
create table seller(
idSeller int auto_increment primary key,
SocialName varchar (255) not null,
AbstName varchar (255),
CNPJ char (15),
CPF char (9),
location varchar (255), 
contact char(11) not null,
constraint unique_cnpj_seller unique (CNPJ),
constraint unique_cpf_seller unique (CPF)
);
desc seller;

-- CRIANDO TABELA PRODUTO/VENDEDOR
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);
desc productSeller;

-- CRIANDO A TABELA: PRODUTO/ORDEM
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder)
);
desc productOrder;

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);
desc storageLocation;

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);
desc productSupplier;


show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';
