# Dados da CONAB - Produção Agrícola Brasileira

## Arquivos Disponíveis

### 1. BrasilUFSerieHist.xls
Série histórica de dados de produção agrícola por estados brasileiros (Unidades da Federação)

**Conteúdo do Arquivo:**
- Dados de produção por estado
- Séries temporais de safras
- Métricas principais:
  * Área plantada (hectares)
  * Produtividade (kg/ha)
  * Volume de produção (toneladas)
- Informações por período de safra

### 2. BrasilProdutoSerieHist.xls
Série histórica de dados de produção agrícola por tipo de produto

**Conteúdo do Arquivo:**
- Dados específicos por produto agrícola
- Séries temporais completas
- Métricas detalhadas:
  * Área plantada (hectares)
  * Produtividade (kg/ha)
  * Volume de produção (toneladas)
- Informações por safra

## Especificações Técnicas

### Formato dos Dados
- Arquivos em formato XLS (Excel)
- Múltiplas planilhas por arquivo
- Codificação: Windows-1252
- Padrões brasileiros:
  * Datas: DD/MM/AAAA
  * Números: Vírgula como separador decimal

### Origem dos Dados
- Fonte: CONAB (Companhia Nacional de Abastecimento)
- URL: https://www.conab.gov.br/info-agro/safras/serie-historica-das-safras
- Data de referência: Novembro de 2023

## Utilização no Projeto

Estes dados foram utilizados para:
1. Modelagem do banco de dados
   - Identificação de entidades
   - Definição de atributos
   - Estabelecimento de relacionamentos

2. Definição de Tipos de Dados
   - Tamanhos de campos
   - Precisão numérica
   - Formatos de data

3. Desenvolvimento de Consultas
   - Análises de produção
   - Comparativos históricos
   - Rankings de produtividade

## Observações Importantes

1. **Preservação**
   - Arquivos originais mantidos sem modificação
   - Backup dos dados fonte do projeto
   - Referência para validações

2. **Qualidade dos Dados**
   - Fonte oficial governamental
   - Metodologia padronizada
   - Dados validados pela CONAB

3. **Integração**
   - Dados refletidos no modelo relacional
   - Estrutura normalizada implementada
   - Consultas otimizadas desenvolvidas
