#language: pt
#encoding: utf-8

Funcionalidade: Contar todas as salas do sistema
Como Administrador do Sistema
eu quero ver quantas salas existem dentro do sistema

Contexto:
Dado que eu sou o administrador do sistema com email "admin@admin.com" senha "admin123"
E que eu esteja na pagina backoffice

Esquema do Cenário: Contar todas as salas
Dado que existam três salas
Quando eu entrar no dashboard de admin
Então eu devo ver a contagem de todas os salas

Esquema do Cenário: Contagem de salas quando não tiver nenhuma sala
E que não tenha nenhuma sala no sistema
Quando eu entrar no dashboard de admin
Então nenhuma sala deve ser mostrada
