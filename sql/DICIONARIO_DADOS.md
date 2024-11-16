# Dicionário de Dados - Produção Agrícola Brasileira

## Tabelas

### estados
Armazena informações sobre os estados brasileiros.

| Coluna | Tipo | Descrição | Restrições |
|--------|------|-----------|------------|
| id_estado | INTEGER | Identificador único do estado | PK, Auto Incremento |
| sigla | CHAR(2) | Sigla do estado (ex: SP, RJ) | NOT NULL |
| nome | VARCHAR(50) | Nome completo do estado | NOT NULL |
| regiao | VARCHAR(20) | Região do estado (Norte, Nordeste, etc.) | NOT NULL |

### produtos
Cadastro dos produtos agrícolas monitorados.

| Coluna | Tipo | Descrição | Restrições |
|--------|------|-----------|------------|
| id_produto | INTEGER | Identificador único do produto | PK, Auto Incremento |
| nome | VARCHAR(100) | Nome do produto | NOT NULL |
| categoria | VARCHAR(50) | Categoria do produto | NOT NULL |
| unidade_area | VARCHAR(10) | Unidade de medida da área | NOT NULL, Default 'ha' |
| unidade_producao | VARCHAR(10) | Unidade de medida da produção | NOT NULL, Default 't' |
| unidade_produtividade | VARCHAR(10) | Unidade de medida da produtividade | NOT NULL, Default 'kg/ha' |
| created_at | TIMESTAMP | Data/hora de criação do registro | NOT NULL |
| updated_at | TIMESTAMP | Data/hora da última atualização | NOT NULL |

### safras
Períodos de safra agrícola.

| Coluna | Tipo | Descrição | Restrições |
|--------|------|-----------|------------|
| id_safra | INTEGER | Identificador único da safra | PK, Auto Incremento |
| ano_inicial | INTEGER | Ano de início da safra | NOT NULL |
| ano_final | INTEGER | Ano de término da safra | NOT NULL |
| periodo | VARCHAR(20) | Período da safra | NOT NULL |
| descricao | VARCHAR(100) | Descrição adicional da safra | NULL |

### producao
Dados de produção agrícola por estado, produto e safra.

| Coluna | Tipo | Descrição | Restrições |
|--------|------|-----------|------------|
| id_producao | INTEGER | Identificador único do registro | PK, Auto Incremento |
| id_estado | INTEGER | Referência ao estado | FK (estados.id_estado), NOT NULL |
| id_produto | INTEGER | Referência ao produto | FK (produtos.id_produto), NOT NULL |
| id_safra | INTEGER | Referência à safra | FK (safras.id_safra), NOT NULL |
| area_plantada | DECIMAL(12,2) | Área plantada em hectares | NULL |
| produtividade | DECIMAL(12,2) | Produtividade em kg/ha | NULL |
| producao | DECIMAL(12,2) | Produção em toneladas | NULL |
| data_coleta | DATE | Data da coleta dos dados | NOT NULL |
| fonte | VARCHAR(50) | Fonte dos dados | NOT NULL, Default 'CONAB' |
| created_at | TIMESTAMP | Data/hora de criação do registro | NOT NULL |
| updated_at | TIMESTAMP | Data/hora da última atualização | NOT NULL |

## Relacionamentos

### producao -> estados
- Tipo: N:1 (Muitos para Um)
- Chave Estrangeira: producao.id_estado -> estados.id_estado
- Descrição: Cada registro de produção está associado a um estado

### producao -> produtos
- Tipo: N:1 (Muitos para Um)
- Chave Estrangeira: producao.id_produto -> produtos.id_produto
- Descrição: Cada registro de produção está associado a um produto

### producao -> safras
- Tipo: N:1 (Muitos para Um)
- Chave Estrangeira: producao.id_safra -> safras.id_safra
- Descrição: Cada registro de produção está associado a uma safra

## Unidades de Medida

- Área: Hectares (ha)
- Produção: Toneladas (t)
- Produtividade: Quilogramas por Hectare (kg/ha)

## Fonte dos Dados

Principal fonte de dados: CONAB (Companhia Nacional de Abastecimento)
- Séries históricas por estado
- Séries históricas por produto
- Atualização: mensal/anual

## Observações

1. Todos os timestamps são armazenados no fuso horário do banco de dados
2. Campos numéricos usam precisão de 2 casas decimais
3. Regiões seguem o padrão do IBGE (Norte, Nordeste, Centro-Oeste, Sudeste, Sul)
4. Datas de coleta são obrigatórias para rastreabilidade
5. Fonte dos dados é padronizada como 'CONAB' por default
