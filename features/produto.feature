Feature: Produto
  As a produto
  I want to adicionar um nome ao produto
  So that criar um produto na encomenda

  Scenario: criar produto valido
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu preencho remetente 'Amazon', data '12-12-2021', seleciono o morador de nome 'Sabrino'
    And clico em Criar Encomenda
    And clico em adicionar produto
    And preecho nome do produto 'cafeteira'
    And clico em criar produto
    Then vejo a mensagem produto criado com sucesso

  Scenario: criar produto com nome invalido
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu preencho remetente 'Amazon', data '12-12-2021', seleciono o morador de nome 'Sabrino'
    And clico em Criar Encomenda
    And clico em adicionar produto
    And preecho nome do produto 'caf'
    And clico em criar produto
    Then vejo a mensagem nome do produto e muito curto

  Scenario: criar produto com nome vazio
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu preencho remetente 'Amazon', data '12-12-2021', seleciono o morador de nome 'Sabrino'
    And clico em Criar Encomenda
    And clico em adicionar produto
    And preecho nome do produto ''
    And clico em criar produto
    Then vejo a mensagem nome do produto nao pode ficar em branco

  Scenario: editar produto
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu preencho remetente 'Amazon', data '12-12-2021', seleciono o morador de nome 'Sabrino'
    And clico em Criar Encomenda
    And clico em adicionar produto
    And preecho nome do produto 'caneca'
    And clico em criar produto
    And clico no produto de nome 'caneca'
    And clico em editar
    And modifico o nome para 'caneca branca'
    And clico em atualizar produto
    Then vejo a mensagem produto foi atualizado com sucesso

  Scenario: editar produto com nome curto
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu preencho remetente 'Amazon', data '12-12-2021', seleciono o morador de nome 'Sabrino'
    And clico em Criar Encomenda
    And clico em adicionar produto
    And preecho nome do produto 'caneca'
    And clico em criar produto
    And clico no produto de nome 'caneca'
    And clico em editar
    And modifico o nome para 'can'
    And clico em atualizar produto
    Then vejo a mensagem nome do produto e muito curto