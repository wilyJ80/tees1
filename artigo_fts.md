# Guia Prático: Busca Textual no PostgreSQL (Full Text Search)

A busca textual (FTS) no PostgreSQL é uma alternativa robusta e leve a ferramentas externas como Elasticsearch. Este guia demonstra como implementar uma busca eficiente utilizando o banco de dados `bd_pesquisadores`.

## 1. Construindo o Documento de Busca

Um "documento" na FTS é a unidade lógica que desejamos pesquisar. No nosso caso, queremos buscar produções acadêmicas pelo título do artigo e pelo nome do pesquisador.

```sql
SELECT 
    p.nome || ' ' || pr.nomeartigo AS documento
FROM producoes pr
JOIN pesquisadores p ON p.pesquisadores_id = pr.pesquisadores_id;
```

Para tornar essa string pesquisável, usamos a função `to_tsvector()`, que normaliza as palavras em lexemas (raízes das palavras).

## 2. Realizando Consultas Básicas

O operador `@@` é utilizado para verificar se um `tsvector` corresponde a uma `tsquery`.

```sql
SELECT p.nome, pr.nomeartigo
FROM producoes pr
JOIN pesquisadores p ON p.pesquisadores_id = pr.pesquisadores_id
WHERE to_tsvector('portuguese', pr.nomeartigo) @@ to_tsquery('portuguese', 'robótica');
```

## 3. Pesos e Relevância (Ranking)

Podemos atribuir pesos diferentes para partes do documento (A, B, C ou D). Por exemplo, o título do artigo (`nomeartigo`) pode ser mais importante que o nome do pesquisador.

```sql
SELECT 
    p.nome, 
    pr.nomeartigo,
    ts_rank(
        setweight(to_tsvector('portuguese', pr.nomeartigo), 'A') || 
        setweight(to_tsvector('portuguese', p.nome), 'B'),
        to_tsquery('portuguese', 'robótica')
    ) AS relevancia
FROM producoes pr
JOIN pesquisadores p ON p.pesquisadores_id = pr.pesquisadores_id
WHERE (setweight(to_tsvector('portuguese', pr.nomeartigo), 'A') || 
       setweight(to_tsvector('portuguese', p.nome), 'B')) @@ to_tsquery('portuguese', 'robótica')
ORDER BY relevancia DESC;
```

## 4. Lidando com Acentos e Dicionários

A extensão `unaccent` é essencial para que buscas por "robotica" (sem acento) encontrem "robótica".

```sql
CREATE EXTENSION IF NOT EXISTS unaccent;

SELECT nomeartigo
FROM producoes
WHERE to_tsvector('portuguese', unaccent(nomeartigo)) @@ to_tsquery('portuguese', unaccent('robotica'));
```

## 5. Otimização com Visões Materializadas

Para grandes volumes de dados, calcular o `tsvector` em cada consulta é custoso. A solução é criar uma **Materialized View** e indexá-la com um índice **GIN**.

```sql
CREATE MATERIALIZED VIEW busca_producoes AS
SELECT 
    pr.producoes_id,
    p.nome AS pesquisador,
    pr.nomeartigo,
    setweight(to_tsvector('portuguese', unaccent(pr.nomeartigo)), 'A') || 
    setweight(to_tsvector('portuguese', unaccent(p.nome)), 'B') AS documento
FROM producoes pr
JOIN pesquisadores p ON p.pesquisadores_id = pr.pesquisadores_id;

CREATE INDEX idx_busca_documento ON busca_producoes USING gin(documento);

-- Para atualizar os dados:
REFRESH MATERIALIZED VIEW busca_producoes;
```

## 6. Erros de Ortografia (Fuzzy Search)

A extensão `pg_trgm` permite encontrar termos similares mesmo com erros de digitação.

```sql
CREATE EXTENSION IF NOT EXISTS pg_trgm;

SELECT nomeartigo, similarity(nomeartigo, 'robotica') as similaridade
FROM producoes
WHERE similarity(nomeartigo, 'robotica') > 0.3
ORDER BY similaridade DESC;
```

## Conclusão

O PostgreSQL oferece ferramentas poderosas para busca textual sem a necessidade de infraestrutura adicional. Combinando `tsvector`, `unaccent` e `Materialized Views`, você obtém um motor de busca "bom o suficiente" e extremamente performático.
