Feature: Encomenda
  As a Usuario do sistema de gerenciamento de encomendas
  I want to Criar, editar, visualizar e remover encomenda
  So that Eu possa gerenciar as encomendas do condominio

  Scenario: nova encomenda
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu crio uma encomenda com remetente 'Amazon', data '12-12-2021', seleciono o user 'funcionario' e morador de nome 'Sabrino'
    And clico em Criar Encomenda
    Then vejo uma mensagem encomenda realiza com sucesso

  Scenario: nova encomenda sem remetente
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu crio uma encomenda com remetente '', data '12-12-2021', seleciono o user 'funcionario' e morador de nome 'Sabrino'
    And clico em Criar Encomenda
    Then vejo uma mensagem remetente nao pode ficar em branco

  Scenario: nova encomenda sem remetente
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu crio uma encomenda com remetente 'te', data '12-12-2021', seleciono o user 'funcionario' e morador de nome 'Sabrino'
    And clico em Criar Encomenda
    Then vejo uma mensagem remetente muito curto

  Scenario: nova encomenda com data no passado
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu crio uma encomenda com remetente 'teste02', data '12-12-2011', seleciono o user 'funcionario' e morador de nome 'Sabrino'
    And clico em Criar Encomenda
    Then vejo uma mensagem data nao pode ser no passado

  Scenario: nova encomenda sem data
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o nome 'Sabrino' que mora na rua 'Rua teste' existe
    And Estou na pagina de criar encomenda
    When eu crio uma encomenda com remetente 'teste02', data '', seleciono o user 'funcionario' e morador de nome 'Sabrino'
    And clico em Criar Encomenda
    Then vejo uma mensagem data nao pode ficar em branco