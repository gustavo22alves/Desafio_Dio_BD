show databases; -- VERIFICANDO BANCO DE DADOS
use ecommerce; -- UTILIZANDO BANCO DE DADOS EXISTENTE
show tables; -- VERIFICANDO TABELAS EXISTENTE NESTE BANDO DE DADOS
desc clients; -- VERIFICANDO ATRIBUTOS NO QUAL A TABELA CONSISTE

-- INSERINDO DADOS A TABELA

insert into Clients (Fname, Minit, Lname, CPF, Address) 
	values
		('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
		('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
		('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
		('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
		('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');

-- REALIZAR TESTE PARA CONFERÊNCIA DA INSERÇÃO DOS DADOS.
select * from clients;

-- INSERINDO DADOS RELACIONADOS AO PRODUTO
desc product; -- SABER QUAIS DADOS PRECISAM SER INSERIDOS
-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) 
	values
		('Fone de ouvido',false,'Eletrônico','4',null),
		('Barbie Elsa',true,'Brinquedos','3',null),
		('Body Carters',true,'Vestimenta','5',null),
		('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
		('Sofá retrátil',False,'Móveis','3','3x57x80'),
		('Farinha de arroz',False,'Alimentos','2',null),
		('Fire Stick Amazon',False,'Eletrônico','3',null);

-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from product;

-- INSERINDO DADOS DE ORDENS
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
	values
		(1, default,'compra via aplicativo',null,1),
		(2,default,'compra via aplicativo',50,0),
		(3,'Confirmado',null,null,1),
		(4,default,'compra via web site',150,0);

-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from orders;

-- INSERINDO DADOS DE PRODUTO/PEDIDO
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) 
	values
		(1,5,2,null),
		(2,5,1,null),
		(3,6,1,null);
	 
-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from productOrder;

-- INSERINDO DADOS DE FORNECEDOR E QUANTIDADE
insert into productStorage (storageLocation,quantity) 
	values 
		('Rio de Janeiro',1000),
		('Rio de Janeiro',500),
		('São Paulo',10),
		('São Paulo',100),
		('São Paulo',10),
		('Brasília',60);

-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from productStorage;

-- INSERINDO DADOS DE PRODUTO E LOCALIZAÇÃO
insert into storageLocation (idLproduct, idLstorage, location)
	values
		(1,2,'RJ'),
		(2,6,'GO');
        
-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from storageLocation;


-- INSERINDO DADOS DOS FORNECEDORES
insert into supplier (SocialName, CNPJ, contact) 
	values 
		('Almeida e filhos', 123456789123456,'21985474'),
		('Eletrônicos Silva',854519649143457,'21985484'),
		('Eletrônicos Valma', 934567893934695,'21975474');

-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from supplier;
        

  -- INSERINDO DADOS DOS PRODUTOS E FORNECEDORES    
insert into productSupplier (idPsSupplier, idPsProduct, quantity) 
	values
		(1,1,500),
		(1,2,400),
		(2,4,633),
		(3,3,5),
		(2,5,10);
-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from productSupplier;

-- INSERINDO DADOS VENDEDOR.      
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) 
	values 
		('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
		('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
		('Kids World',null,456789123654485,null,'São Paulo', 1198657484);
        
-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from seller;


-- INSERINDO DADOS DOS PRODUTOS, VENDEDORES E QUANTIDADE   
insert into productSeller (idPseller, idPproduct, prodQuantity) 
	values 
		(1,6,80),
		(2,7,10);

-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from productSeller;

-- INSERINDO DADOS DE FORMA DE PAGAMENTO      
desc payments;
insert into payments (idclient, idPayment, typePayment, limitAvailable)
	values
		(1,1,1,100),
		(2,2,3,1000),
        (3,3,3,200),
        (1,4,2,500);
        
-- REALIZANDO NOVAMENTE TESTE PARA VERIRICAÇÃO DA INSERÇÃO DOS DADOS
select * from payments;


-- ********************************************************************
-- ********************************************************************

-- REALIZANDO ALGUNS TESTES DE CONSULTA/PESQUISA DO BANCO DE DADOS EM GERAL

-- ********************************************************************
-- ********************************************************************


-- CONTAR O NÚMERO DE CLIENTES EXISTENTES.
select count(*) from clients;

-- CONSULTA O CLIENTE, OS DADOS DO MESMO E AS ORDENS NA QUAIS CORRESPONDEM
select * from clients c, orders o Where c.idClient = idOrderClient;

-- RECUPERA O CLIENTE, SUAS RESPECTIVAS ORDENS E SEUS STATUS
select Fname,Lname, idOrder, orderStatus 
from clients c, orders o 
where c.idClient = idOrderClient;

-- RECUPERA CLIENTE(CONCATENAÇÃO), SUAS ORDENS E STATUS
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status 
from clients c, orders o 
where c.idClient = idOrderClient;

-- INSERINDO ORDEM
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
	values 
		(2, default,'compra via aplicativo',null,1);
                      
-- RECUPERA A QUANTIDADE DE ORDENS EXISTENTES
select count(*)
from clients c, orders o 
where c.idClient = idOrderClient;

-- RECUPERA TODAS AS ORDENS, N, ID DO CLIENTE, STATUS, COMPRA
select * from orders;

-- RECUPERAÇÃO DE PEDIDO COM PRODUTO ASSOCIADO
select * from clients c 
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder
group by idClient;
        
-- RECUPERAR QUANTOS PEDIDOS FORAM REALIZADOS PELOS CLIENTES?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
inner join orders o ON c.idClient = o.idOrderClient
group by idClient; 

-- RECUPERAR DADOS DE FORMA DE PAGAMENO
select * from payments;

-- REALIZA A CONTAGEM DE PAGAMENTOS QUE CONSTAM NO SISTEMA
select count(*)idPayment from Payments;

-- REALIZA A CONTAGEM DE PAGEMENTOS REALIZADOS COM CARTÃo
select count(*)typePayment from payments
where typePayment = 3;

-- REALIZA A CONSULTA CLIENTE, TIPO DE PAGAMENTO E STATUS 
select idclient, typePayment, orderStatus 
from payments p, orders o 
where p.idClient = idOrderClient
order by idclient; 

select Fname,Lname, idOrder, orderStatus, typePayment 
from clients c, orders o, payments p
where c.idClient = idOrderClient;

