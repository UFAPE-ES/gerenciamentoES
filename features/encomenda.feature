Feature: Encomenda
  As a usuario do sistema de gerenciamento de encomendas
  I want to criar, editar, visualizar e remover encomenda
  So that eu possa gerenciar as encomendas do condominio

Scenario: criar encomenda com sucesso
  Given eu estou na pagina de nova encomenda
  And tem um funcionario registrado com o nome ‘Pedro’, email ‘pedro@gmail.com’, senha ‘@Ped123456’, confirmo a senha com ‘@Ped123456’ 
  And tem registrado um morador com o nome 'Antonio', cpf ‘307.431.250-53’, bloco ‘A’, casanum ‘7’, contato ‘981000000’
  When eu crio a encomenda com o remetente ‘Americanas’, data ‘11-11-2021’, seleciono o morador 'Antonio', seleciono o funcionario ‘Pedro’
  And eu clico no botao 'Criar encomenda'
  Then eu vejo que a encomenda com remetente ‘Americanas’, data ‘11-11-2021’, morador 'Antonio', funcionario ‘Pedro’ esta na lista de encomendas

Scenario: editar remetente de encomenda com sucesso
  Given eu estou na pagina de listagem de encomendas
  And eu vejo a encomenda com remetente ‘Shopee’, data ‘12-11-2021’, funcionario id '1', morador id '1'
  When eu altero o nome do remetente para ‘Amazon’
  And eu clico no botao 'Atualizar encomenda'
  Then eu vejo uma mensagem que a encomenda com o remetente alterado para 'Amazon'

Scenario: editar remetente de encomenda invalida
  Given eu estou na pagina de listagem de encomendas
  And eu vejo a encomenda com remetente ‘Shopee’, data ‘12-11-2021’, funcionario id '1', morador id '1'
  When eu altero o nome do remetente para ‘x’
  And eu clico no botao 'Atualizar encomenda'
  Then eu vejo uma mensagem de erro 'remetente e muito curto'

Scenario: criar encomenda invalida
  Given eu estou na pagina de nova encomenda
  And tem um funcionario registrado com o nome ‘Pedro’, email ‘pedro@gmail.com’, senha ‘@Ped123456’, confirmo a senha com ‘@Ped123456’ 
  And tem registrado um morador com o nome 'Antonio', cpf ‘307.431.250-53’, bloco ‘A’, casanum ‘7’, contato ‘981000000’
  When eu crio a encomenda com o remetente 'x', data ‘12-12-2021’, seleciono o morador 'Antonio', seleciono o funcionario ‘Pedro’
  And eu clico no botao 'Criar encomenda'
  Then eu vejo uma mensagem de erro 'remetente e muito curto'

Scenario: remover encomenda
  Given eu estou na pagina de listagem de encomendas
  And eu vejo uma encomenda com remetente 'ElectroLux', data ‘24-12-2021’, funcionario 'Jose', morador ‘Freitas’
  When eu clico no botao de deletar 'destroy'
  And eu clico no botao 'ok' na pergunta de confirmacao
  Then eu vejo que a encomenda 'ElectroLux' foi removida
