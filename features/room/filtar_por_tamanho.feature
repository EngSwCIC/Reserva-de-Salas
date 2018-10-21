# language: pt
# encoding: utf-8

Funcionalidade: Filtro por tamanho da sala de aula (capacidade máxima de alunos).
Como usuário autenticado no sistema
	Para que possa visualizar apenas as salas que acomodam os alunos que espero
	Eu quero filtrar a lista de salas pela capacidade máxima de alunos que ela comporta.
	
Cenario: A lista de salas filtrada pelo tamanho da sala é exibida com sucesso
	Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
	E eu esteja na página “listar_salas”
	E eu clicar no filtro <tamanho>
	E digitar no campo de número <numero_alunos> o número máximo de alunos em uma sala
	E eu clicar no botão “filtrar”
	Será exibida uma lista de salas que comportam o número de alunos digitados por mim
