# Modulo - PAIS

#POST - CREATE
use imobiliaria2;

INSERT INTO PAIS (id, Nome)
VALUES (11101, 'Pais_11101');

#GET - READ
SELECT * FROM PAIS;

#PUT - UPDATE
UPDATE PAIS
SET Nome = 'Pais_Update'
WHERE id = 11101;

#DELETE - DELETE
#use esse tipo de alter table para quando nao puder deletar os dados ALTER TABLE PAIS ADD COLUMN ATIVO INT DEFAULT 1;
DELETE FROM PAIS
WHERE id = 11101;
	






# Modulo - ESTADO
#POST - CREATE
INSERT INTO ESTADO (id, Nome, PAIS_id)
VALUES (11101, 'Estado_11101', 11101);

#GET - READ
SELECT 
    e.id AS EstadoID,
    e.Nome AS Estado,
    p.Nome AS Pais
FROM ESTADO e
JOIN PAIS p ON e.PAIS_id = p.id;


#PUT - UPDATE
UPDATE ESTADO
SET Nome = 'Estado_Update',
    PAIS_id = 11102
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM ESTADO
WHERE id = 11101;






# Modulo - CIDADE
#POST - CREATE
INSERT INTO CIDADE (id, Nome, ESTADO_id)
VALUES (11101, 'Cidade_11101', 11101);

#GET - READ
SELECT 
    c.id AS CidadeID,
    c.Nome AS Cidade,
    e.Nome AS Estado
FROM CIDADE c
JOIN ESTADO e ON c.ESTADO_id = e.id;


#PUT - UPDATE
UPDATE CIDADE
SET Nome = 'Cidade_Update',
    ESTADO_id = 11102
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM CIDADE
WHERE id = 11101;







# Modulo - BAIRRO
#POST - CREATE
INSERT INTO BAIRRO (id, Nome, CIDADE_id)
VALUES (11101, 'Bairro_11101', 11101);

#GET - READ
SELECT 
    b.id AS BairroID,
    b.Nome AS Bairro,
    c.Nome AS Cidade
FROM BAIRRO b
JOIN CIDADE c ON b.CIDADE_id = c.id;

#PUT - UPDATE
UPDATE BAIRRO
SET Nome = 'Bairro_Update',
    CIDADE_id = 11102
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM BAIRRO
WHERE id = 11101;







# Modulo - TIPO_IMOVEL
#POST - CREATE
INSERT INTO TIPO_IMOVEL (id, Tipo)
VALUES (11101, 'Tipo_11101');

#GET - READ
SELECT * FROM TIPO_IMOVEL;

#PUT - UPDATE
UPDATE TIPO_IMOVEL
SET Tipo = 'Tipo_Update'
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM TIPO_IMOVEL
WHERE id = 11101;







# Modulo - IMOVEL
#POST - CREATE
INSERT INTO IMOVEL (id, TAMANHO_M2, Rua, Numero, TIPO_IMOVEL_id, BAIRRO_id, Preco, Observacao)
VALUES (11101, 103.55, 'Rua_11101', 10, 11101, 11101, 192261.00, 'Obs_11101');

#GET - READ
SELECT 
    i.id AS ImovelID,
    i.Rua,
    i.Numero,
    t.Tipo AS TipoImovel,
    b.Nome AS Bairro
FROM IMOVEL i
JOIN TIPO_IMOVEL t ON i.TIPO_IMOVEL_id = t.id
JOIN BAIRRO b ON i.BAIRRO_id = b.id;

#PUT - UPDATE
UPDATE IMOVEL
SET TAMANHO_M2 = 200.99,
    Rua = 'Rua_Update',
    Numero = 99,
    TIPO_IMOVEL_id = 11102,
    BAIRRO_id = 11102,
    Preco = 555000.00,
    Observacao = 'Obs_Update'
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM IMOVEL
WHERE id = 11101;








# Modulo - DOCUMENTO_IMOVEL
#POST - CREATE
INSERT INTO DOCUMENTO_IMOVEL (id, Tipo, urlDocumento, Data, IMOVEL_id)
VALUES (11101, 'TipoDoc_11101', 'http://doc_11101.com', '2023-01-02', 11101);

#GET - READ
SELECT 
    d.id AS DocumentoID,
    d.Tipo,
    d.urlDocumento,
    i.Rua,
    i.Numero
FROM DOCUMENTO_IMOVEL d
JOIN IMOVEL i ON d.IMOVEL_id = i.id;


#PUT - UPDATE
UPDATE DOCUMENTO_IMOVEL
SET Tipo = 'Doc_Update',
    urlDocumento = 'http://doc_update.com',
    Data = '2023-05-05',
    IMOVEL_id = 11102
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM DOCUMENTO_IMOVEL
WHERE id = 11101;






# Modulo - IMAGEM_IMOVEL
#POST - CREATE
INSERT INTO IMAGEM_IMOVEL (id, Url, IMOVEL_id)
VALUES (11101, 'http://img_11101.com', 11101);

#GET - READ
SELECT 
    img.id AS ImagemID,
    img.Url,
    i.Rua,
    i.Numero
FROM IMAGEM_IMOVEL img
JOIN IMOVEL i ON img.IMOVEL_id = i.id;


#PUT - UPDATE
UPDATE IMAGEM_IMOVEL
SET Url = 'http://img_update.com',
    IMOVEL_id = 11102
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM IMAGEM_IMOVEL
WHERE id = 11101;







# Modulo - CONTRATO
#POST - CREATE
INSERT INTO CONTRATO (id, Data, IMOVEL_id, situacao)
VALUES (11101, '2023-02-02', 11101, 1);

#GET - READ
SELECT 
    c.id AS ContratoID,
    c.Data,
    c.situacao,
    i.Rua,
    i.Numero
FROM CONTRATO c
JOIN IMOVEL i ON c.IMOVEL_id = i.id;

#PUT - UPDATE
UPDATE CONTRATO
SET Data = '2023-06-06',
    IMOVEL_id = 11102,
    situacao = 2
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM CONTRATO
WHERE id = 11101;


# Modulo - PAGAMENTO
#POST - CREATE
INSERT INTO PAGAMENTO (id, Valor, FormaPagamento, CONTRATO_id)
VALUES (11101, 500.00, 'Pix', 11101);

#GET - READ
SELECT 
    p.id AS PagamentoID,
    p.Valor,
    p.FormaPagamento,
    c.Data AS DataContrato
FROM PAGAMENTO p
JOIN CONTRATO c ON p.CONTRATO_id = c.id;

#PUT - UPDATE
UPDATE PAGAMENTO
SET Valor = 999.99,
    FormaPagamento = 'Boleto',
    CONTRATO_id = 11102
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM PAGAMENTO
WHERE id = 11101;


# Modulo - PESSOA
#POST - CREATE
INSERT INTO PESSOA (id, Nome, TipoDocumento, Documento, Email, Telefone, Rua, Numero, BAIRRO_id, TipoPessoa)
VALUES (11101, 'Pessoa_11101', 'Fisica', 'DOC11101', 'email11101@teste.com', '99999-0001', 'RuaPessoa_11101', 111001, 11101, 'Proprietario');

#GET - READ
SELECT 
    p.id AS PessoaID,
    p.Nome,
    p.TipoPessoa,
    b.Nome AS Bairro
FROM PESSOA p
JOIN BAIRRO b ON p.BAIRRO_id = b.id;

#PUT - UPDATE
UPDATE PESSOA
SET Nome = 'Pessoa_Update',
    TipoDocumento = 'Juridica',
    Documento = 'DOC_Update',
    Email = 'email_update@teste.com',
    Telefone = '88888-0002',
    Rua = 'Rua_Update',
    Numero = 202,
    BAIRRO_id = 11102,
    TipoPessoa = 'Cliente'
WHERE id = 11101;

#DELETE - DELETE
DELETE FROM PESSOA
WHERE id = 11101;

