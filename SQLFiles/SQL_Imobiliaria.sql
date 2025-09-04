create database imobiliaria;

use imobiliaria;

create table IMOVEL(
	id int auto_increment primary key,
    TAMANHO_M2 decimal(16,4),
    Rua varchar(255),
    Numero int,
    TIPO_IMOVEL_id int,
    constraint FK_IMOVEL_TIPO_IMOVEL foreign key(TIPO_IMOVEL_id) references TIPO_IMOVEL(id),
    BAIRRO_id int,
    constraint FK_IMOVEL_BAIRRO foreign key(BAIRRO_id) references BAIRRO(id),
    Preco decimal(16,4),
    Observacao varchar(500)
);

create table DOCUMENTO_IMOVEL(
	id int,
    Tipo varchar(255),
    urlDocumento varchar(255),
    Data date,
    IMOVEL_id INT,
    constraint FK_DOCUMENTO_IMOVEL_IMOVEL foreign key(IMOVEL_id) references IMOVEL(id)    
);

create table IMAGEM_IMOVEL(
	id int,
    Url varchar(255),
    IMOVEl_id int,
    constraint FK_IMAGEM_IMOVEL_IMOVEL foreign key (IMOVEL_id) references IMOVEL(id)
);

create table TIPO_IMOVEL(
	id int primary key,
	Tipo varchar(255)
);

create table CONTRATO(
	id int primary key,
	Data date,
    IMOVEl_id int,
    constraint FK_CONTRATO_IMOVEL foreign key (IMOVEL_id) references IMOVEL(id),
    situacao tinyint
);

create table PAGAMENTO(
	id int primary key,
    Valor decimal(16,4),
    FormaPagamento Enum('Pix', 'Boleto', 'Transferencia', 'Credito', 'Debito', 'Dinhero'),
    CONTRATO_id int,
    constraint FK_PAGAMENTO_IMOVEL foreign key (CONTRATO_id) references CONTRATO(id)
);

create table PESSOA (
  id int primary key,
  Nome varchar(255),
  TipoDocumento ENUM('Fisica', 'Juridica'),
  Documento varchar(255),
  Emai varchar(255),
  Telefone varchar(255),
  Rua varchar(255),
  Numero INT,
  BAIRRO_id INT,
  constraint FK_PESSOA_BAIRRO foreign key (BAIRRO_id) references BAIRRO(id),
  TipoPessoa ENUM('Cliente', 'Proprietario')
);



create table BAIRRO(
	id int primary key,
    Nome varchar(255),
    CIDADE_id int
    
);

create table CIDADE(
	id int primary key,
    Nome varchar(255),
    ESTADO_id int
);

create table ESTADO(
	id int primary key,
    Nome varchar(255),
    PAIS_id int
);

CREATE TABLE PAIS (
    id INT PRIMARY KEY,
    Nome varchar(255)
);