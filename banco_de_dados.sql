
-- BANCO DE DADOS: SEGURANCA_CIBERNETICA

PRAGMA foreign_keys = ON;

-- 1. CRIACAO DAS TABELAS

CREATE TABLE INSTITUICAO (
    id_instituicao INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    tipo TEXT NOT NULL,
    estado TEXT NOT NULL
);

CREATE TABLE INCIDENTE (
    id_incidente INTEGER PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_incidente TEXT,
    quantidade_afetados INTEGER,
    id_instituicao INTEGER,
    situacao TEXT,
    FOREIGN KEY (id_instituicao)
    REFERENCES INSTITUICAO(id_instituicao)
);

CREATE TABLE DADOS_EXPOSTOS (
    id_dado INTEGER PRIMARY KEY,
    tipo_dado TEXT NOT NULL,
    nivel_risco TEXT NOT NULL,
    id_incidente INTEGER,
    FOREIGN KEY (id_incidente)
    REFERENCES INCIDENTE(id_incidente)
);

-- 2. INSERCAO DE INSTITUICOES FICTICIAS

INSERT INTO INSTITUICAO VALUES
(1, 'Instituicao Financeira Alfa', 'Financeira', 'PR'),
(2, 'Instituto Publico Beta', 'Publica', 'SP'),
(3, 'Empresa de Tecnologia Gama', 'Tecnologia', 'SC');

-- 3. INSERCAO DE INCIDENTES SIMULADOS

INSERT INTO INCIDENTE VALUES
(1, 'Simulacao de vazamento de dados cadastrais',
'2026-11-10', 500, 1, 'Em investigacao'),

(2, 'Simulacao de acesso nao autorizado',
'2026-11-15', 1200, 2, 'Em investigacao'),

(3, 'Simulacao de indisponibilidade de sistema',
'2026-11-20', 300, 3, 'Controlado');

-- 4. INSERCAO DE DADOS EXPOSTOS SIMULADOS

INSERT INTO DADOS_EXPOSTOS VALUES
(1, 'CPF ficticio', 'Alto', 1),
(2, 'E-mail ficticio', 'Medio', 1),
(3, 'Telefone ficticio', 'Medio', 2),
(4, 'Endereco ficticio', 'Alto', 2),
(5, 'Dados cadastrais ficticios', 'Alto', 3);

-- 5. CONSULTA SELECT

SELECT * FROM INSTITUICAO;

-- 6. CONSULTA WHERE: DADOS DE ALTO RISCO

SELECT * FROM DADOS_EXPOSTOS
WHERE nivel_risco = 'Alto';

-- 7. CONSULTA ORDER BY

SELECT * FROM INCIDENTE
ORDER BY quantidade_afetados DESC;

-- 8. CONSULTA INNER JOIN

SELECT
    INSTITUICAO.nome,
    INCIDENTE.descricao,
    INCIDENTE.quantidade_afetados
FROM INSTITUICAO
INNER JOIN INCIDENTE
ON INSTITUICAO.id_instituicao =
INCIDENTE.id_instituicao;

-- 9. CONSULTA GROUP BY E COUNT

SELECT
    tipo_dado,
    COUNT(*) AS quantidade
FROM DADOS_EXPOSTOS
GROUP BY tipo_dado;

-- 10. UPDATE: ALTERAR SITUACAO DO INCIDENTE

UPDATE INCIDENTE
SET situacao = 'Controlado'
WHERE id_incidente = 1;

-- CONFERIR A ALTERACAO

SELECT * FROM INCIDENTE;
