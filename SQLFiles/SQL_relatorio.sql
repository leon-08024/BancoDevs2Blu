use imobiliaria2;

# Imoveis Mais Caros e Mais Baratos dos 100 maiores Bairros em questão de valor
SELECT 
    b.Nome AS Bairro,
    MAX(i.Preco) AS ImovelMaisCaro,
    MIN(i.Preco) AS ImovelMaisBarato
FROM IMOVEL i
JOIN BAIRRO b ON i.BAIRRO_id = b.id
GROUP BY b.Nome
ORDER BY ImovelMaisCaro DESC
Limit 100;


#Quantidade de Formas de Pagamentos
SELECT
	FormaPagamento,
    COUNT(DISTINCT id) AS totalFormas
FROM PAGAMENTO
group by FormaPagamento
order by totalFormas desc;



#Quantidade de imoveis por Proprietario dop mmair pro menor
SELECT
	p.Nome AS Proprietario,
    count(distinct i.id) as QuantidadeImoveis
FROM PESSOA p
JOIN CONTRATO_PESSOA cp ON cp.PESSOA_id = p.id
JOIN CONTRATO c ON c.id = cp.CONTRATO_id
JOIN IMOVEL i ON i.id = c.IMOVEL_id
where p.TipoPessoa = 'Proprietario'
group by p.id, p,Nome
order by Quantidade_Imoveis desc;


#Distribuição de clientes por tipo de pessoa (Física/Jurídica)
SELECT
	TipoDocumento,
    count(distinct id) as Total_Tipo
FROM PESSOA
group by TipoPessoa;

#Vendas por tipo de imóvel
create view V_vendas_por_tipo as
SELECT 
    ti.Tipo AS Tipo_Imovel,
    COUNT(c.id) AS Total_Vendas
FROM TIPO_IMOVEL ti
	JOIN IMOVEL i ON ti.id = i.TIPO_IMOVEL_id
    JOIN CONTRATO c ON i.id = c.IMOVEL_id
WHERE c.situacao = 1
GROUP BY ti.Tipo
ORDER BY Total_Vendas DESC;


