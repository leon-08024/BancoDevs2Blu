CREATE DATABASE oficina67;

USE oficina67;

CREATE TABLE cliente (
 Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Telefone VARCHAR(15)    
);

CREATE TABLE mecanico (
 Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255)
);

CREATE TABLE peca (
 Id INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255),
    Preco DECIMAL(16,4)
);

CREATE TABLE ordem_servico (
 Id INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255),
    DataOrdem DATE,
    Valor DECIMAL(16,4),
    ClienteId INT, 
    MecanicoId INT,
    CONSTRAINT FK_ORDEM_SERVICO_CLIENTE
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    CONSTRAINT FK_ORDEM_SERVICO_MECANICO
    FOREIGN KEY (MecanicoId) REFERENCES Mecanico(Id)
);

CREATE TABLE ordem_servico_peca (
 OrdemServicoId INT,
    PecaId INT,
    Quantidade INT,
    Preco DECIMAL(16,4),
    PRIMARY KEY (OrdemServicoId, PecaId),
    CONSTRAINT FK_ORDEM_SERVICO_PECA_ORDEM_SERVICO
    FOREIGN KEY (OrdemServicoId) REFERENCES ordem_servico(Id),
    CONSTRAINT FK_ORDEM_SERVICO_PECA_PECA
    FOREIGN KEY (PecaId) REFERENCES peca(Id)    
);









 