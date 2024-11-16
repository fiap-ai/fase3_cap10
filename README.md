# FIAP - Faculdade de Informática e Administração Paulista

<p align="center">
<a href= "https://www.fiap.com.br/"><img src="assets/logo-fiap.png" alt="FIAP - Faculdade de Informática e Admnistração Paulista" border="0" width=40% height=40%></a>
</p>

<br>

# Banco de Dados de Produção Agrícola Brasileira

## 🔗 Links Importantes
- [Dicionário de Dados](sql/DICIONARIO_DADOS.md)
- [Documentação do Modelo](models/README.md)
- [Diretrizes do Projeto](docs/DIRECTIONS.md)

## 👨‍🎓 Integrantes: 
- <a href="https://www.linkedin.com/in/gabemule/">Gabriel Mule Monteiro</a>

## 👩‍🏫 Professores:
### Tutor(a) 
- <a href="https://www.linkedin.com/company/inova-fusca">Lucas Gomes Moreira</a>

## 📜 Descrição

Este projeto implementa um banco de dados para armazenamento e análise de informações sobre a produção agrícola no Brasil, utilizando dados da CONAB (Companhia Nacional de Abastecimento).

### Atendimento aos Requisitos

1. **Coleta de Dados**
   - Fonte: CONAB (Companhia Nacional de Abastecimento)
   - Dados: Séries históricas de produção agrícola
   - Arquivos: Disponíveis em data/raw/conab/
   - Métricas: Área plantada, produtividade, produção por estado/safra

2. **Normalização do Banco de Dados**
   
   a) Primeira Forma Normal (1FN):
   - Eliminação de grupos repetitivos (cada tabela tem um propósito único)
   - Valores atômicos (campos como área, produção são indivisíveis)
   - Chaves primárias definidas (id_estado, id_produto, etc.)

   b) Segunda Forma Normal (2FN):
   - Dependência total da chave primária
   - Tabelas separadas para estados, produtos e safras
   - Dados específicos em suas respectivas tabelas

   c) Terceira Forma Normal (3FN):
   - Eliminação de dependências transitivas
   - Dados normalizados em tabelas apropriadas
   - Exemplo: dados de estados separados da produção

3. **Modelagem**
   - Modelo Conceitual (MER) em models/mer/
   - Modelo Relacional em models/relational/
   - Diagramas em PNG e definições em XML

4. **Implementação SQL**
   
   a) Estrutura das Tabelas:
   - Tipos de dados apropriados (INTEGER, DECIMAL, VARCHAR)
   - Chaves primárias e estrangeiras
   - Constraints de integridade
   - Campos de auditoria (created_at, updated_at)

   b) Consultas Implementadas:
   - Produção total por estado/safra
   - Evolução da área plantada
   - Ranking de produtividade
   - Análises regionais
   - Comparativos entre safras

## 📁 Estrutura de Arquivos

```
.
├── data/                    # Dados brutos e processados
│   └── raw/conab/          # Dados originais da CONAB
├── docs/                    # Documentação do projeto
├── models/                  # Modelos do banco de dados
│   ├── mer/                # Modelo Entidade-Relacionamento
│   └── relational/         # Modelo Relacional
└── sql/                    # Scripts SQL
    ├── queries/            # Consultas de análise
    └── schema/             # Definição das tabelas
```

## 💻 Funcionalidades

### Consultas Implementadas

1. **Produção por Estado/Safra**
```sql
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
```

2. **Evolução da Área Plantada**
```sql
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
```

3. **Ranking de Produtividade**
```sql
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
```

### Consultas Adicionais

4. **Visão Regional**
```sql
SELECT 
    e.regiao,
    p.nome AS produto,
    s.ano_inicial || '/' || s.ano_final AS safra,
    COUNT(DISTINCT e.id_estado) AS numero_estados,
    SUM(pr.area_plantada) AS area_total_ha,
    ROUND(AVG(pr.produtividade), 2) AS produtividade_media_kgha,
    SUM(pr.producao) AS producao_total_ton,
    ROUND(SUM(pr.producao) * 100.0 / SUM(SUM(pr.producao)) 
        OVER (PARTITION BY s.id_safra), 2) AS percentual_nacional
FROM producao pr
JOIN estados e ON pr.id_estado = e.id_estado
JOIN produtos p ON pr.id_produto = p.id_produto
JOIN safras s ON pr.id_safra = s.id_safra
WHERE p.nome = :nome_produto
    AND s.ano_inicial = :ano_safra
GROUP BY e.regiao, p.nome, s.ano_inicial, s.ano_final
ORDER BY producao_total_ton DESC;
```

## 🗃 Histórico de lançamentos

* 0.1.0 - 25/03/2024
    * Implementação do modelo de dados normalizado
    * Criação das tabelas e relacionamentos
    * Desenvolvimento das consultas de análise
    * Documentação completa do projeto

## 📋 Licença

<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/">MODELO GIT FIAP por <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://fiap.com.br">Fiap</a> está licenciado sobre <a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International</a>.</p>
