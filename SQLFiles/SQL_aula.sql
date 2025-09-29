CREATE DATABASE LojaDB;
USE LojaDB;

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome       VARCHAR(100) NOT NULL,
    Cidade     VARCHAR(100),
    Estado     CHAR(2),
    DataCadastro DATE
);

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome       VARCHAR(100) NOT NULL,
    Categoria  VARCHAR(50),
    Preco      DECIMAL(10,2) NOT NULL
);

CREATE TABLE Pedidos (
    PedidoID  INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT NOT NULL,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE ItensPedido (
    ItemID    INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID  INT NOT NULL,
    ProdutoID INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnit  DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PedidoID)  REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

CREATE TABLE Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID    INT NOT NULL,
    DataPagamento DATE,
    Valor       DECIMAL(10,2),
    Metodo      VARCHAR(30),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
); 
# * FROM Clientes where Estado = 'SC' AND Cidade = 'Florianopolis'


INSERT INTO Clientes (ClienteID,Nome,Cidade,Estado,DataCadastro) VALUES (NULL,'Andre Souza','Curitiba','PR','2024-02-05');
INSERT INTO Clientes (ClienteID,Nome,Cidade,Estado,DataCadastro) VALUES (NULL,'Andreia Souza Martins','Curitiba','PR','2024-03-05');

select * from Clientes where Nome like '%C%';

select * from Produtos order by Preco desc;

select * 
	from Pedidos P , Clientes C 
    where P.Clienteid = C.Clienteid;

select *
	from Pedidos P
	join Clientes C
    ON P.Clienteid = C.Clienteid;
    
    
select ClienteID , count(*) from Pedidos group by ClienteID;
select *, Quantidade*PrecoUnit
from ItensPedido;

select sum(Quantidade*PrecoUnit) as Faturamento, 
	sum(Quantidade*PrecoUnit)*0.94 as FaturamentoLiquido,
	round(avg(Quantidade*PrecoUnit), 2) as TicketMedio,
	max(Quantidade*PrecoUnit) as TicketMax,
	min(Quantidade*PrecoUnit) as TicketMin,
	group_concat(PedidoId) as Pedidos 
from ItensPedido;


select ProdutoId, sum(Quantidade*PrecoUnit) as Valorotal
from ItensPedido IP
join Produtos P
group by ProdutoId
order by ProdutoId;