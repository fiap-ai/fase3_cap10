# Diretrizes do Projeto: Banco de Dados de Produção Agrícola Brasileira

## Requisitos Originais

```
Objetivo:

Aplicar os conceitos de modelagem de dados aprendidos nos capítulos 7, 8, 9 e 10 para criar um modelo de banco de dados que armazene e analise informações sobre a produção agrícola no Brasil, utilizando dados de órgãos como CONAB (Companhia Nacional de Abastecimento), IBGE (Instituto Brasileiro de Geografia e Estatística), MAPA (Ministério da Agricultura, Pecuária e Abastecimento), Embrapa (Empresa Brasileira de Pesquisa Agropecuária), INPE (Instituto Nacional de Pesquisas Espaciais) ou CNABRASIL. 

Descrição:

Alguns dos órgãos citados disponibilizam diversas informações sobre a agricultura brasileira, como dados sobre área plantada, produtividade e produção de diferentes culturas agrícolas em cada estado e safra.

Seu desafio é criar um modelo de banco de dados normalizado para armazenar esses dados de forma estruturada e eficiente. 

Etapas:

Pesquise em algum dos órgãos citados e escolha um conjunto de dados relacionado à produção agrícola para utilizar neste desafio (por exemplo, a série histórica de produção de grãos por estado). Faça o download dos dados.
Analise os dados e identifique as principais entidades, atributos e relacionamentos para criar um modelo conceitual utilizando o Modelo Entidade-Relacionamento (MER). Desenhe o diagrama entidade-relacionamento.
Aplique as regras de normalização (1FN, 2FN e 3FN) para refinar o modelo e eliminar redundâncias e anomalias.
Converta o modelo conceitual normalizado para o modelo lógico relacional, criando o diagrama do modelo relacional.
Defina a nomenclatura padronizada para as tabelas e campos seguindo as convenções apresentadas.
Crie o código SQL para gerar as tabelas do banco de dados, definindo chaves primárias, chaves estrangeiras e restrições de integridade.
Elabore algumas consultas SQL relevantes para análise dos dados, como:
Produção total de uma determinada cultura por estado em uma safra;
Evolução da área plantada de uma cultura ao longo dos anos;
Ranking dos estados com maior produtividade em uma cultura específica.
8. Documente o modelo criado através de um dicionário de dados. 

Entregáveis:

Diagrama Entidade-Relacionamento (MER);
Diagrama do Modelo Relacional;
Código SQL para criação das tabelas;
Consultas SQL solicitadas;
Dicionário de dados. 
O modelo deve ser realizado em grupo de até cinco alunos. Além disso, precisa ter uma documentação descritiva/explicativa em markdown (padrão do README.md do GitHub). 

O grupo deve entregar um link do repositório GitHub que contenha arquivos .xml e .sql e/ou .dmd da modelagem e documentação readme.md e uma imagem .png do seu modelo.

Use o Datamodeler (disponível no site da Oracle) ou SQLDesigner https://github.com/ondras/wwwsqldesigner) para elaborar a modelagem do seu banco um banco de dados.
```

## Implementação

### 1. Configuração do Projeto e Coleta de Dados
1. Criar estrutura do projeto:
   - Criar repositório GitHub
   - Configurar pastas do projeto (docs, sql, models, data)
   - Criar documentação inicial

2. Seleção e Coleta de Dados:
   - Pesquisar e selecionar uma das seguintes fontes:
     * CONAB (Companhia Nacional de Abastecimento)
     * IBGE (Instituto Brasileiro de Geografia e Estatística)
     * MAPA (Ministério da Agricultura, Pecuária e Abastecimento)
     * Embrapa (Empresa Brasileira de Pesquisa Agropecuária)
     * INPE (Instituto Nacional de Pesquisas Espaciais)
     * CNABRASIL
   - Baixar dados históricos de produção agrícola
   - Focar em métricas principais: área plantada, produtividade e produção por estado e safra
   - Armazenar dados brutos na pasta data

### 2. Modelagem do Banco de Dados

#### 2.1 Modelo Conceitual (MER)
1. Analisar dados para identificar:
   - Entidades principais (ex: Estados, Culturas, Safras)
   - Atributos de cada entidade
   - Relacionamentos entre entidades
2. Criar Diagrama Entidade-Relacionamento usando Oracle Data Modeler ou SQLDesigner
3. Documentar todas as entidades, atributos e relacionamentos
4. Exportar diagrama em formatos PNG e XML

#### 2.2 Processo de Normalização
1. Aplicar Primeira Forma Normal (1FN):
   - Eliminar grupos repetitivos
   - Garantir valores atômicos
   - Identificar chaves primárias

2. Aplicar Segunda Forma Normal (2FN):
   - Garantir que atributos não-chave dependam totalmente da chave primária
   - Criar tabelas separadas para dependências parciais

3. Aplicar Terceira Forma Normal (3FN):
   - Eliminar dependências transitivas
   - Criar tabelas separadas quando necessário

#### 2.3 Modelo Lógico
1. Converter modelo conceitual normalizado para modelo relacional
2. Definir:
   - Estruturas das tabelas
   - Chaves primárias
   - Chaves estrangeiras
   - Restrições
3. Criar diagrama do modelo relacional
4. Exportar diagrama em formatos PNG e XML

### 3. Implementação SQL

#### 3.1 Criação do Banco de Dados
1. Criar scripts SQL para:
   - Criação de tabelas com tipos de dados apropriados
   - Restrições de chave primária e estrangeira
   - Outras restrições de integridade
   - Criação de índices quando necessário

#### 3.2 Desenvolvimento de Consultas
1. Desenvolver consultas SQL para análises requeridas:
   ```sql
   -- Exemplos de consultas a serem implementadas:
   -- 1. Produção total por estado e safra
   -- 2. Evolução da área plantada ao longo dos anos
   -- 3. Ranking de produtividade por estado
   ```

### 4. Documentação

#### 4.1 Dicionário de Dados
1. Criar dicionário de dados completo incluindo:
   - Nomes e descrições das tabelas
   - Nomes, tipos e descrições das colunas
   - Restrições
   - Relacionamentos
   - Índices

#### 4.2 Documentação do Projeto
1. Criar README.md com:
   - Visão geral do projeto
   - Instruções de instalação/configuração
   - Informações sobre fonte de dados
   - Explicações sobre o modelo
   - Exemplos de consultas

### 5. Lista de Entregáveis
- [x] Diagrama Entidade-Relacionamento (MER)
  - [x] Formato PNG (models/mer/diagrama_mer.png)
  - [x] Formato XML (models/mer/modelo_agricola.xml)
- [x] Diagrama do Modelo Relacional
  - [x] Formato PNG (models/relational/diagrama_relacional.png)
  - [x] Formato XML (models/relational/modelo_relacional.xml)
- [x] Arquivos SQL
  - [x] Scripts de criação de tabelas (sql/schema/generated_tables.sql)
  - [x] Consultas de análise (sql/queries/analise_producao.sql)
- [x] Documentação
  - [x] Dicionário de Dados (sql/DICIONARIO_DADOS.md)
  - [x] README.md (na raiz do projeto)
  - [x] DIRECTIONS.md (este arquivo)
- [x] Arquivos do Modelo
  - [x] Arquivos XML do SQLDesigner
  - [x] Exportações PNG dos diagramas

### Status de Implementação

1. ✓ Configuração do Projeto e Coleta de Dados
   - ✓ Estrutura de diretórios criada
   - ✓ Dados da CONAB coletados
   - ✓ Documentação inicial estabelecida

2. ✓ Modelagem do Banco de Dados
   - ✓ Modelo Conceitual (MER) criado
   - ✓ Normalização aplicada (1FN, 2FN, 3FN)
   - ✓ Modelo Relacional desenvolvido

3. ✓ Implementação SQL
   - ✓ Scripts de criação de tabelas
   - ✓ Consultas de análise implementadas
   - ✓ Índices e constraints definidos

4. ✓ Documentação
   - ✓ Dicionário de dados completo
   - ✓ README com explicações detalhadas
   - ✓ Documentação técnica organizada

### Ferramentas Utilizadas
1. ✓ Controle de Versão:
   - Git
   - GitHub

2. ✓ Modelagem:
   - SQLDesigner para MER e Modelo Relacional

3. ✓ Banco de Dados:
   - MySQL/MariaDB (scripts compatíveis)

### Conclusão
O projeto atende todos os requisitos especificados, implementando um banco de dados normalizado para armazenamento e análise de dados de produção agrícola brasileira, com documentação completa e código-fonte organizado.
