#language:pt

Funcionalidade: Consulta de usuários
  Realiza a consulta dos dados de usuário
  através da web api's

  Cenario: Pesquisar usuário pelo nome
    Dado que pesquiso pelo nome "Naik"
    Então eu valido a lista retornada com o nome

  @smoke
  Cenario: Efetuar a busca do usuário pelo id
    Dado que eu busco a lista de usuários
    E faço a pesquisa pelo primeiro id
    Então eu valido a lista retornada
