Feature: Encomenda
  As a Usuario do sistema de gerenciamento de encomendas
  I want to Criar, editar, visualizar e remover encomendas
  So that Eu possa gerenciar os encomendas do condominio

  Scenario: Criar encomenda
    Given o funcionario com email 'pepe@gmail.com' e senha '123456' existe
    And Estou na pagina de criar encomenda
    When Eu preencho o remetente com 'Amazon' e a data da entrega com '30-12-2021'
    And Eu clico em Criar Encomenda
    Then Eu vejo que o remetente de nome 'Amazon' e data da entrega '30-12-2021' foi salvo

  Scenario: Criar encomenda com remetente invalido
    Given o funcionario com email 'pepe@gmail.com' e senha '123456' existe
    And Estou na pagina de criar encomenda
    When Eu preencho o remetente com '' e a data da entrega com '30-12-2021'
    And Eu clico em Criar Encomenda
    Then Eu vejo uma mensagem de remetente deve ser preenchido

  Scenario: Criar encomenda com remetente muito curto
    Given o funcionario com email 'pepe@gmail.com' e senha '123456' existe
    And Estou na pagina de criar encomenda
    When Eu preencho o remetente com 'A' e a data da entrega com '30-12-2021'
    And Eu clico em Criar Encomenda
    Then Eu vejo uma mensagem de remetente e muito curto

  Scenario: Criar encomenda com data da entrega invalida
    Given o funcionario com email 'pepe@gmail.com' e senha '123456' existe
    And Estou na pagina de criar encomenda
    When Eu preencho o remetente com 'Amazon' e a data da entrega com ''
    And Eu clico em Criar Encomenda
    Then Eu vejo uma mensagem de data da entrega deve ser preenchido

  Scenario: Listar encomendas
    Given o funcionario com email 'pepe@gmail.com' e senha '123456' existe
    And Estou na pagina de listar encomendas
    Then Eu vejo as encomendas listadas