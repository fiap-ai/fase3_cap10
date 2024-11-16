# Documentação dos Modelos de Dados

## Estrutura de Diretórios

```
models/
├── mer/                # Modelo Entidade-Relacionamento
│   ├── diagrama_mer.png    # Diagrama visual do MER
│   └── modelo_agricola.xml # Definição do modelo em XML
└── relational/         # Modelo Relacional
    ├── diagrama_relacional.png # Diagrama do modelo relacional
    └── modelo_relacional.xml   # Definição em XML
```

## Modelos Implementados

### 1. Modelo Entidade-Relacionamento (MER)

#### Entidades Principais
1. **Estado**
   - Representa os estados brasileiros
   - Atributos:
     * id_estado (PK)
     * sigla (CHAR(2))
     * nome (VARCHAR(50))
     * regiao (VARCHAR(20))

2. **Produto**
   - Produtos agrícolas monitorados
   - Atributos:
     * id_produto (PK)
     * nome (VARCHAR(100))
     * categoria (VARCHAR(50))
     * unidades de medida

3. **Safra**
   - Períodos de safra agrícola
   - Atributos:
     * id_safra (PK)
     * ano_inicial (INTEGER)
     * ano_final (INTEGER)
     * periodo (VARCHAR(20))

4. **Produção**
   - Dados de produção agrícola
   - Atributos:
     * id_producao (PK)
     * área_plantada (DECIMAL)
     * produtividade (DECIMAL)
     * produção (DECIMAL)
     * data_coleta (DATE)

#### Relacionamentos
- Estado -> Produção (1:N)
- Produto -> Produção (1:N)
- Safra -> Produção (1:N)

### 2. Modelo Relacional

#### Tabelas Implementadas
1. **estados**
   - Chave primária: id_estado
   - Campos não nulos: sigla, nome, regiao
   - Restrições: valores válidos para região

2. **produtos**
   - Chave primária: id_produto
   - Campos não nulos: nome, categoria
   - Valores default para unidades
   - Campos de auditoria

3. **safras**
   - Chave primária: id_safra
   - Campos não nulos: anos e período
   - Restrição: ano_final = ano_inicial + 1

4. **producao**
   - Chave primária: id_producao
   - Chaves estrangeiras para todas as entidades
   - Campos de medição e controle
   - Campos de auditoria

## Normalização Aplicada

### Primeira Forma Normal (1FN)
- Todos os atributos são atômicos
- Chaves primárias definidas
- Sem grupos repetitivos

### Segunda Forma Normal (2FN)
- Dependências totais das chaves primárias
- Dados relacionados separados em tabelas próprias
- Relacionamentos via chaves estrangeiras

### Terceira Forma Normal (3FN)
- Sem dependências transitivas
- Atributos dependem apenas da chave primária
- Normalização completa das estruturas

## Ferramentas Utilizadas

### SQLDesigner
- Criação dos diagramas
- Exportação XML
- Geração de scripts SQL

## Padrões Adotados

### Nomenclatura
- Tabelas: plural, minúsculas
- Colunas: singular, minúsculas
- Chaves: prefixo 'id_'
- Índices: prefixo 'idx_'

### Tipos de Dados
- Textos: VARCHAR com tamanhos adequados
- Números: INTEGER para IDs, DECIMAL para medidas
- Datas: DATE para coleta, TIMESTAMP para auditoria

### Constraints
- NOT NULL em campos obrigatórios
- Valores DEFAULT apropriados
- CHECK constraints para validações

## Observações Técnicas

1. **Integridade Referencial**
   - ON DELETE RESTRICT
   - ON UPDATE CASCADE
   - Índices em chaves estrangeiras

2. **Auditoria**
   - created_at: criação do registro
   - updated_at: última atualização
   - fonte: origem dos dados

3. **Performance**
   - Tipos de dados otimizados
   - Índices estratégicos
   - Relacionamentos eficientes
