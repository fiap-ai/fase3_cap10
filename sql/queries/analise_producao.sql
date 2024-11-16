-- Consultas SQL para análise da produção agrícola brasileira

-- 1. Produção total de uma determinada cultura por estado em uma safra
SELECT 
    e.nome AS estado,
    p.nome AS produto,
    s.ano_inicial || '/' || s.ano_final AS safra,
    SUM(pr.area_plantada) AS area_total_ha,
    ROUND(AVG(pr.produtividade), 2) AS produtividade_media_kgha,
    SUM(pr.producao) AS producao_total_ton
FROM producao pr
JOIN estados e ON pr.id_estado = e.id_estado
JOIN produtos p ON pr.id_produto = p.id_produto
JOIN safras s ON pr.id_safra = s.id_safra
WHERE p.nome = :nome_produto
    AND s.ano_inicial = :ano_safra
GROUP BY e.nome, p.nome, s.ano_inicial, s.ano_final
ORDER BY producao_total_ton DESC;

-- 2. Evolução da área plantada de uma cultura ao longo dos anos
SELECT 
    p.nome AS produto,
    s.ano_inicial,
    SUM(pr.area_plantada) AS area_total_ha,
    ROUND(((SUM(pr.area_plantada) - LAG(SUM(pr.area_plantada)) 
        OVER (ORDER BY s.ano_inicial)) / LAG(SUM(pr.area_plantada)) 
        OVER (ORDER BY s.ano_inicial) * 100), 2) AS variacao_percentual
FROM producao pr
JOIN produtos p ON pr.id_produto = p.id_produto
JOIN safras s ON pr.id_safra = s.id_safra
WHERE p.nome = :nome_produto
GROUP BY p.nome, s.ano_inicial
ORDER BY s.ano_inicial;

-- 3. Ranking dos estados com maior produtividade em uma cultura específica
SELECT 
    e.nome AS estado,
    p.nome AS produto,
    s.ano_inicial || '/' || s.ano_final AS safra,
    ROUND(AVG(pr.produtividade), 2) AS produtividade_media_kgha,
    SUM(pr.producao) AS producao_total_ton,
    SUM(pr.area_plantada) AS area_plantada_ha,
    RANK() OVER (ORDER BY AVG(pr.produtividade) DESC) AS ranking
FROM producao pr
JOIN estados e ON pr.id_estado = e.id_estado
JOIN produtos p ON pr.id_produto = p.id_produto
JOIN safras s ON pr.id_safra = s.id_safra
WHERE p.nome = :nome_produto
    AND s.ano_inicial = :ano_safra
GROUP BY e.nome, p.nome, s.ano_inicial, s.ano_final
ORDER BY produtividade_media_kgha DESC;

-- Consultas adicionais úteis

-- 4. Visão geral da produção por região
SELECT 
    e.regiao,
    p.nome AS produto,
    s.ano_inicial || '/' || s.ano_final AS safra,
    COUNT(DISTINCT e.id_estado) AS numero_estados,
    SUM(pr.area_plantada) AS area_total_ha,
    ROUND(AVG(pr.produtividade), 2) AS produtividade_media_kgha,
    SUM(pr.producao) AS producao_total_ton,
    ROUND(SUM(pr.producao) * 100.0 / SUM(SUM(pr.producao)) OVER (PARTITION BY s.id_safra), 2) AS percentual_nacional
FROM producao pr
JOIN estados e ON pr.id_estado = e.id_estado
JOIN produtos p ON pr.id_produto = p.id_produto
JOIN safras s ON pr.id_safra = s.id_safra
WHERE p.nome = :nome_produto
    AND s.ano_inicial = :ano_safra
GROUP BY e.regiao, p.nome, s.ano_inicial, s.ano_final
ORDER BY producao_total_ton DESC;

-- 5. Comparativo de safras
SELECT 
    p.nome AS produto,
    s.ano_inicial || '/' || s.ano_final AS safra,
    SUM(pr.area_plantada) AS area_total_ha,
    ROUND(AVG(pr.produtividade), 2) AS produtividade_media_kgha,
    SUM(pr.producao) AS producao_total_ton,
    ROUND(((SUM(pr.producao) - LAG(SUM(pr.producao)) 
        OVER (ORDER BY s.ano_inicial)) / LAG(SUM(pr.producao)) 
        OVER (ORDER BY s.ano_inicial) * 100), 2) AS variacao_producao_percentual
FROM producao pr
JOIN produtos p ON pr.id_produto = p.id_produto
JOIN safras s ON pr.id_safra = s.id_safra
WHERE p.nome = :nome_produto
GROUP BY p.nome, s.ano_inicial, s.ano_final
ORDER BY s.ano_inicial;

-- Exemplo de uso:
-- Substitua :nome_produto pelo nome do produto desejado (ex: 'Soja', 'Milho', etc.)
-- Substitua :ano_safra pelo ano inicial da safra desejada (ex: 2022, 2023, etc.)
