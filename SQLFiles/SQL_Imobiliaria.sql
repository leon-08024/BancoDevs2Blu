create database imobiliaria2;
use imobiliaria2;

-- País, Estado, Cidade, Bairro primeiro (hierarquia geográfica)
create table PAIS (
    id int auto_increment primary key,
    Nome varchar(255) not null
);

create table ESTADO (
    id int auto_increment primary key,
    Nome varchar(255) not null,
    PAIS_id int not null,
    constraint FK_ESTADO_PAIS foreign key (PAIS_id) references PAIS(id)
);

create table CIDADE(
    id int auto_increment primary key,
    Nome varchar(255) not null,
    ESTADO_id int not null,
    constraint FK_CIDADE_ESTADO foreign key (ESTADO_id) references ESTADO(id)
);

create table BAIRRO(
    id int auto_increment primary key,
    Nome varchar(255) not null,
    CIDADE_id int not null,
    constraint FK_BAIRRO_CIDADE foreign key (CIDADE_id) references CIDADE(id)
);

-- Tipos de imóvel
create table TIPO_IMOVEL(
    id int auto_increment primary key,
    Tipo varchar(255) not null
);

-- Imóvel
create table IMOVEL(
    id int auto_increment primary key,
    TAMANHO_M2 decimal(16,4) not null,
    Rua varchar(255) not null,
    Numero int not null,
    TIPO_IMOVEL_id int not null,
    constraint FK_IMOVEL_TIPO_IMOVEL foreign key(TIPO_IMOVEL_id) references TIPO_IMOVEL(id),
    BAIRRO_id int not null,
    constraint FK_IMOVEL_BAIRRO foreign key(BAIRRO_id) references BAIRRO(id),
    Preco decimal(16,4),
    Observacao varchar(500)
);

-- Documentos do imóvel
create table DOCUMENTO_IMOVEL(
    id int auto_increment primary key,
    Tipo varchar(255) not null,
    urlDocumento varchar(255),
    Data date not null,
    IMOVEL_id INT not null,
    constraint FK_DOCUMENTO_IMOVEL_IMOVEL foreign key(IMOVEL_id) references IMOVEL(id)
);

-- Imagens do imóvel
create table IMAGEM_IMOVEL(
    id int auto_increment primary key,
    Url varchar(255) not null,
    IMOVEl_id int not null,
    constraint FK_IMAGEM_IMOVEL_IMOVEL foreign key (IMOVEL_id) references IMOVEL(id)
);

-- Contrato
create table CONTRATO(
    id int auto_increment primary key,
    Data date not null,
    IMOVEl_id int not null,
    constraint FK_CONTRATO_IMOVEL foreign key (IMOVEL_id) references IMOVEL(id),
    situacao tinyint not null
);

-- Pagamento
create table PAGAMENTO(
    id int auto_increment primary key,
    Valor decimal(16,4) not null,
    FormaPagamento Enum('Pix', 'Boleto', 'Transferencia', 'Credito', 'Debito', 'Dinheiro') not null,
    CONTRATO_id int not null,
    constraint FK_PAGAMENTO_CONTRATO foreign key (CONTRATO_id) references CONTRATO(id)
);

-- Pessoa
create table PESSOA (
  id int auto_increment primary key,
  Nome varchar(255) not null,
  TipoDocumento ENUM('Fisica', 'Juridica') not null,
  Documento varchar(255) not null,
  Email varchar(255) not null,
  Telefone varchar(255) not null,
  Rua varchar(255) not null,
  Numero INT not null,
  BAIRRO_id INT not null,
  constraint FK_PESSOA_BAIRRO foreign key (BAIRRO_id) references BAIRRO(id),
  TipoPessoa ENUM('Cliente', 'Proprietario') not null
);
CREATE TABLE CONTRATO_PESSOA (
    CONTRATO_id INT NOT NULL,
    PESSOA_id INT NOT NULL,
    TipoPessoa ENUM('Cliente', 'Proprietario') NOT NULL,
    PRIMARY KEY (CONTRATO_id, PESSOA_id),
    CONSTRAINT FK_CONTRATO_PESSOA_CONTRATO FOREIGN KEY (CONTRATO_id) REFERENCES CONTRATO(id),
    CONSTRAINT FK_CONTRATO_PESSOA_PESSOA FOREIGN KEY (PESSOA_id) REFERENCES PESSOA(id)
);
