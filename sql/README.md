# Implementação do Banco de Dados para Produção Agrícola Brasileira

## Estrutura de Diretórios

```
sql/
├── schema/             # Scripts de criação do banco
│   └── generated_tables.sql  # Definições das tabelas
└── queries/            # Consultas de análise
    └── analise_producao.sql  # Consultas implementadas
```

## Visão Geral do Esquema do Banco

### Tabelas Principais

1. **Estados**
   - Informações dos estados brasileiros
   - Campos: id_estado, sigla, nome, regiao
   - Chave primária: id_estado

2. **Produtos**
   - Cadastro de produtos agrícolas
   - Campos: id_produto, nome, categoria, unidades de medida
   - Chave primária: id_produto
   - Campos de auditoria: created_at, updated_at

3. **Safras**
   - Períodos de safra agrícola
   - Campos: id_safra, ano_inicial, ano_final, periodo, descricao
   - Chave primária: id_safra

4. **Produção**
   - Dados de produção agrícola
   - Campos: área plantada, produtividade, produção
   - Chaves estrangeiras: id_estado, id_produto, id_safra
   - Campos de auditoria e controle

### Consultas Implementadas

1. **Produção por Estado/Safra**
   - Total de produção por estado
   - Área plantada e produtividade
   - Filtros por produto e período

2. **Evolução da Área Plantada**
   - Série histórica por produto
   - Variação percentual entre períodos
   - Análise de crescimento

3. **Ranking de Produtividade**
   - Classificação dos estados
   - Métricas de produção
   - Comparativos de desempenho

4. **Análises Adicionais**
   - Visão por região
   - Comparativo entre safras
   - Percentuais de participação

## Normalização Aplicada

1. **Primeira Forma Normal (1FN)**
   - Valores atômicos em todos os campos
   - Chaves primárias definidas
   - Sem grupos repetitivos

2. **Segunda Forma Normal (2FN)**
   - Dependência total da chave primária
   - Tabelas separadas para estados, produtos e safras
   - Relacionamentos via chaves estrangeiras

3. **Terceira Forma Normal (3FN)**
   - Sem dependências transitivas
   - Dados normalizados em tabelas apropriadas
   - Integridade referencial mantida

## Tipos de Dados e Convenções

- **Campos Numéricos**
  * INTEGER para IDs e anos
  * DECIMAL(12,2) para medidas
  * Precisão adequada para cada métrica

- **Campos de Texto**
  * CHAR(2) para siglas de estado
  * VARCHAR com tamanhos apropriados
  * Restrições NOT NULL onde necessário

- **Campos de Data/Hora**
  * DATE para datas de coleta
  * TIMESTAMP para auditoria
  * Valores default apropriados

## Observações Técnicas

1. **Integridade dos Dados**
   - Chaves estrangeiras com RESTRICT/CASCADE
   - Valores default significativos
   - Campos de auditoria automatizados

2. **Performance**
   - Índices nas chaves primárias
   - Índices nas chaves estrangeiras
   - Tipos de dados otimizados

3. **Manutenção**
   - Nomenclatura consistente
   - Comentários nas tabelas
   - Documentação atualizada
