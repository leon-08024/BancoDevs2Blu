create database officina_caue1;

use	officina_caue1;


create table cliente (
	id int auto_increment primary key,
    Nome varchar(255),
    Email varchar(255),
    Telefone varchar(15)
);
create table mecanico (
	id int auto_increment primary key,
    Nome varchar(255)
);

create table peca (
	id int auto_increment primary key,
    Descricao varchar(255),
    Preco decimal(16,4)
);

create table ordem_servico(
	id int auto_increment primary key,
	Descricao varchar(255),
    DataOrdem date,
    Valor decimal(16,4),
    Clienteid int,
    Mecanicoid int,
    constraint fk_ordem_servico_cliente foreign key(Clienteid) references cliente(id),
    constraint fk_ordem_servico_mecanico foreign key(Mecanicoid) references mecanico(id)
    
);



create table ordem_servico_peca(
	OrdemServicoid int,
    Pecaid int,
    Quantidade int,
    Preco decimal(16,4),
    primary key (OrdemServicoid,Pecaid),
    constraint fk_ordem_servico_peca_ordem_servico foreign key (OrdemServicoid) references ordem_servico(id),
    constraint fk_ordem_servico_peca_peca foreign key (Pecaid) references peca(id)
);