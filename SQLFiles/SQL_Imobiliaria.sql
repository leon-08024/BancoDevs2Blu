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
	id int primary key,
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


create table bolinha(
	id int primary key,
    nome varchar(255)
);

alter table bolinha add column coluna varchar(255);
alter table bolinha modify coluna text;
alter table bolinha drop column coluna; 

create table bolinha2(
	id int primary key,
	nome varchar(255)
);

alter table bolinha add column bolinha2_id int;
alter table bolinha add constraint fk_bolinha_bolinha2 foreign key (bolinha2_id) references bolinha2(id);

alter table bolinha drop foreign key fk_bolinha_bolinha2; 
drop table bolinha2;
drop table bolinha;

alter table DOCUMENTO_IMOVEL modify id int primary key;
alter table BAIRRO add constraint FK_BAIRRO_ESTADO foreign key (CIDADE_id) references ESTADO(id);
alter table BAIRRO drop foreign key FK_BAIRRO_ESTADO;
alter table CIDADE add constraint FK_CIDADE_ESTADO foreign key (ESTADO_id) references ESTADO(id);
alter table ESTADO add constraint FK_ESTADO_PAIS foreign key (PAIS_id) references PAIS(id);

alter table IMOVEL modify TAMANHO_M2 decimal not null;
alter table IMOVEL modify Rua varchar(255) not null;
alter table IMOVEL modify Numero int not null;

alter table DOCUMENTO_IMOVEL modify Tipo varchar(255) not null;
alter table DOCUMENTO_IMOVEL modify Data date not null;

alter table IMAGEM_IMOVEL modify Url varchar(255) not null;

alter table TIPO_IMOVEL modify Tipo varchar(255) not null;

alter table CONTRATO modify Data date not null;
alter table CONTRATO modify situacao tinyint not null;

alter table PAGAMENTO modify Valor decimal not null;
alter table PAGAMENTO modify FormaPagamento Enum('Pix', 'Boleto', 'Transferencia', 'Credito', 'Debito', 'Dinhero') not null;

alter table PESSOA modify Nome varchar(255);
alter table PESSOA modify TipoDocumento ENUM('Fisica', 'Juridica') not null;
alter table PESSOA modify Documento varchar(255) not null;
alter table PESSOA modify Emai varchar(255) not null;
alter table PESSOA modify Telefone varchar(255) not null;
alter table PESSOA modify Rua varchar(255) not null;
alter table PESSOA modify Numero INT not null;










