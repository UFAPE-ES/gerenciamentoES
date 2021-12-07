Feature: Morador
  As a Usuario do sistema de gerenciamento de encomendas
  I want to Criar, editar, visualizar e remover morador
  So that Eu possa gerenciar os moradores do condominio

  Scenario: novo morador
    Given o funcionario com email 'douglas@gmail.com' e password '123456' existe
    And estou na pagina de login de funcionario
    And eu preencho os campos email 'douglas@gmail.com' e password '123456'
    And clico em log in
    And Estou na pagina de morador
    When eu preencho nome 'Antonio', cpf '307.431.250-53', bloco 'A', casanum '7', telefone '981000000'
    And clico em Criar Morador
    Then eu vejo que o morador de nome 'Antonio' e cpf '307.431.250-53' foi salvo

  Scenario: novo morador invalido
    Given o funcionario com email 'douglas@gmail.com' e password '123456' existe
    And estou na pagina de login de funcionario
    And eu preencho os campos email 'douglas@gmail.com' e password '123456'
    And clico em log in
    And Estou na pagina de morador
    When eu preencho nome 'Pedro', cpf '', bloco 'B', casanum '3', telefone '981000021'
    And clico em Criar Morador
    Then eu vejo uma mensagem de cpf deve ser preenchido

  Scenario: novo morador com telefone invalido
    Given o funcionario com email 'douglas@gmail.com' e password '123456' existe
    And estou na pagina de login de funcionario
    And eu preencho os campos email 'douglas@gmail.com' e password '123456'
    And clico em log in
    And Estou na pagina de morador
    When eu preencho nome 'Joaquim', cpf '919.095.040-25', bloco 'B', casanum '1', telefone '789'
    And clico em Criar Morador
    Then eu vejo uma mensagem de telefone e muito curto

  Scenario: novo morador invalido
    Given o funcionario com email 'douglas@gmail.com' e password '123456' existe
    And estou na pagina de login de funcionario
    And eu preencho os campos email 'douglas@gmail.com' e password '123456'
    And clico em log in
    And Estou na pagina de morador
    When eu preencho nome 'João', cpf '111.115.6', bloco 'A', casanum '2', telefone '981474344'
    And clico em Criar Morador
    Then eu vejo uma mensagem de cpf invalido

  Scenario: novo morador cpf existente
    Given o funcionario com email 'douglas@gmail.com' e password '123456' existe
    And estou na pagina de login de funcionario
    And eu preencho os campos email 'douglas@gmail.com' e password '123456'
    And clico em log in
    And o morador com o cpf '307.431.250-53' existe
    And estou na pagina de criar morador
    When eu preencho nome 'Sabrino', cpf '307.431.250-53', bloco 'C', casanum '3', telefone '999475530'
    And clico em Criar Morador
    Then eu vejo uma mensagem de cpf ja esta em uso
