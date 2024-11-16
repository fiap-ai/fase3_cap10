# Fontes de Dados da Produção Agrícola

## Estrutura de Diretórios

```
data/
└── raw/           # Dados originais não modificados
    └── conab/     # Dados da CONAB (Companhia Nacional de Abastecimento)
```

## Fontes de Dados

### CONAB (Companhia Nacional de Abastecimento)

1. **Série Histórica por Estado**
   - Arquivo: `BrasilUFSerieHist.xls`
   - Fonte: [CONAB - Série Histórica das Safras - Por Unidades da Federação](https://www.conab.gov.br/info-agro/safras/serie-historica-das-safras)
   - Descrição: Dados históricos de produção agrícola por estados brasileiros
   - Variáveis:
     * Área plantada (hectares)
     * Produtividade (kg/ha)
     * Volume de produção (toneladas)
     * Informações por estado

2. **Série Histórica por Produto**
   - Arquivo: `BrasilProdutoSerieHist.xls`
   - Fonte: [CONAB - Série Histórica das Safras - Por Produtos](https://www.conab.gov.br/info-agro/safras/serie-historica-das-safras)
   - Descrição: Dados históricos de produção agrícola por tipo de produto
   - Variáveis:
     * Área plantada (hectares)
     * Produtividade (kg/ha)
     * Volume de produção (toneladas)
     * Informações específicas por produto

## Utilização dos Dados

Os dados da CONAB foram utilizados para:
1. Identificação das entidades e atributos do modelo
2. Definição dos tipos de dados e restrições
3. Estruturação das consultas de análise
4. Validação do modelo de dados

## Características dos Dados

1. **Temporalidade**
   - Séries históricas de safras
   - Dados organizados por ano agrícola
   - Atualizações periódicas pela CONAB

2. **Abrangência**
   - Cobertura nacional (todos os estados)
   - Principais culturas agrícolas
   - Métricas padronizadas de produção

3. **Qualidade**
   - Fonte oficial governamental
   - Metodologia consistente
   - Dados estruturados e validados

## Observações

- Dados obtidos de estatísticas agrícolas oficiais brasileiras
- Métricas seguem padrões internacionais de medição
- Arquivos originais preservados em formato XLS
- Dados utilizados como base para o modelo relacional implementado
