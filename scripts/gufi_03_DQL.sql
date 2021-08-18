USE GUFI_MANHA
GO

--LISTA TODOS OS TIPOS DE USU�RIOS

SELECT * FROM tipoUsuario

--LISTA TODOS OS USU�RIOS

SELECT * FROM usuario

-- LISTA DE TODAS AS PRESEN�AS

	select * from presenca

--SELECIONAR OS DADOS DA INSTITUI��O E OS TIPOS DE EVENTOS

SELECT I.nomeFantasia, TE.tituloTipoEvento, E.nomeEvento, E.descricao, E.acessoLivre, E.dataEvento
FROM evento E
INNER JOIN tipoEvento TE ON E.idTipoEvento = TE.idTipoEvento
INNER JOIN instituicao I ON E.idInstituicao = I.idInstituicao


--SELECIONA OS DADOS MOSTRANDO O TIPO DO USU�RIO

SELECT U.nomeUsuario [usuario], TU.tituloTipopUsuario 
FROM usuario U
INNER JOIN tipoUsuario TU ON U.idTipoUsuario = tu.idTipoUsuario

--SELECIONA OS DADOS DO EVENTO, INSTITUI��O, TIPOS DE EVENTOS E USU�RIOS
--E A SITUA��O DA PRESEN�A

SELECT u.nomeUsuario 'Usu�rio', 
		e.nomeEvento 'Evento',  
		I.nomeFantasia 'Institui��o', 
		TE.tituloTipoEvento 'Tipo de evento',
		S.descricao 'Situa��o'
FROM usuario U
INNER JOIN presenca P ON U.idUsuario = P.idUsuario
INNER JOIN evento E ON E.idEvento = P.idEvento
INNER JOIN tipoEvento TE ON E.idTipoEvento = TE.idTipoEvento
INNER JOIN situacao S ON P.idSituacao = S.idSituacao
INNER JOIN instituicao I ON E.idInstituicao = I.idInstituicao

--BUSCA UM USU�RIO ATRAV�S DE SEU EMAIL

SELECT U.nomeUsuario,
		TU.tituloTipopUsuario,
		U.email,
		U.senha

FROM usuario U
JOIN tipoUsuario TU ON U.idTipoUsuario = TU.idTipoUsuario
WHERE email = 'LUCAS@LUCAS.COM'
AND senha = 'senha123'