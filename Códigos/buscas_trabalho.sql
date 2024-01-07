-- 1: Selecionar o quanto lucro a empresa teve com cada cliente de acordo com cada tipo de serviço, incluindo clientes que não solicitaram serviços, ordenado por tipo e por lucro decrescente
SELECT 
	NVL(S.TIPO, 'NONE'), 
	C.NOME, 
	C.EMAIL, 
	NVL(SUM(S.PRECO - S.CUSTO), 0) AS LUCRO, 
	COUNT(S.CUSTO) AS QTD_SERVICO
FROM CLIENTE C
    LEFT JOIN SERVICO S
    ON S.CLIENTE = C.EMAIL
GROUP BY C.NOME, C.EMAIL, S.TIPO
ORDER BY S.TIPO, LUCRO DESC;

-- 2:
-- Selecione todos os comentarios com nota superior a 3 para sites cujo 
-- um serviço com duração superior a 15 horas foi realizado ao pedido de uma 
-- pessoa juridica(PJ), também selecione o email dos usuários que escreveram tais comentarios.

SELECT DISTINCT 
    U.NOME_USUARIO AS USUARIO, 
    U.EMAIL, 
    UST.NOTA, 
    UST.COMENTARIO
FROM USUARIO U
    JOIN USER_SITE UST
    ON UST.USUARIO = U.NOME_USUARIO
    JOIN SITE ST
    ON UST.SITE = ST.URL
WHERE UST.NOTA > 3
    AND ST.NOME = 'InclusioTech'
    AND U.ATIVIDADE = 'S'
ORDER BY UST.NOTA DESC;

-- 3: Busca as avaliações que certos testadores fizeram num certo período de tempo
SELECT 
    CS.NOME AS CONSULTOR, 
    TC.NOME AS TESTADOR,
    EXTRACT(YEAR FROM CT.DATA) AS ANO,
    CL.NOME AS CLIENTE,
    ST.NOME AS SITE,
    CT.NOTA, 
    CT.COMENTARIO
FROM TESTADOR TC 
    JOIN CONTRIBUICAO CT
    ON TC.CPF = CT.TESTADOR
    JOIN CONSULTOR CS
    ON CS.CPF = CT.CONSULTOR
    JOIN (  
            SELECT S.SERV_COD, S.CLIENTE, S.SITE
            FROM AVALIACAO A
                JOIN SERVICO S
                ON A.SERVICO = S.SERV_COD
         ) SA
    ON SA.SERV_COD = CT.AVALIACAO
    JOIN CLIENTE CL
    ON CL.EMAIL = SA.CLIENTE
    JOIN SITE ST
    ON ST.URL = SA.SITE
ORDER BY CONSULTOR, ANO DESC, CT.NOTA DESC;


-- 4:
-- Para cada desenvolvedor selecione seu nome, cpf e o numero de mudanças 
-- que ele realizou em servicos iniciados em Junho de 2023, ordene-os 
-- por essa contagem
SELECT 
    D.CPF, 
    D.NOME, 
    COUNT(S.SERV_COD) AS NUMERO_MUDANCAS
FROM DESENVOLVEDOR D
    JOIN MUDANCA M
    ON D.CPF = M.DESENVOLVEDOR
    JOIN ADAPTACAO A
    ON M.ADAPTACAO = A.SERVICO
    LEFT OUTER JOIN SERVICO S 
    ON A.SERVICO = S.SERV_COD  
WHERE EXTRACT(MONTH FROM S.INICIO) = '06'
    AND EXTRACT(YEAR FROM S.INICIO) = '2023'    
GROUP BY D.CPF, D.NOME
ORDER BY NUMERO_MUDANCAS;

-- 5:
-- Selecione os nomes de todos os consultores que contribuiram em todas as
-- as avaliacoes cujo o testador Endrick participou
SELECT 
    CS.CPF, 
    CS.NOME
FROM CONSULTOR CS
    JOIN CONTRIBUICAO CT
    ON CS.CPF = CT.CONSULTOR, 
    (
        SELECT C.AVALIACAO
        FROM CONTRIBUICAO C
            JOIN TESTADOR T
            ON C.TESTADOR = T.CPF 
        WHERE T.NOME = 'Endrick'
    ) TABLE2
WHERE CT.AVALIACAO = TABLE2.AVALIACAO
GROUP BY CS.CPF, CS.NOME
HAVING COUNT(CT.AVALIACAO) = (
    SELECT COUNT(AVALIACAO) 
    FROM (
            SELECT C.AVALIACAO
            FROM CONTRIBUICAO C
                JOIN TESTADOR T
                ON C.TESTADOR = T.CPF 
            WHERE T.NOME = 'Endrick'
        )
    );