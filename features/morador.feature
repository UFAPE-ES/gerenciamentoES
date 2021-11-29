Feature: Morador
  As a Usuario do sistema de gerenciamento de encomendas
  I want to Criar, editar, visualizar e remover morador
  So that Eu possa gerenciar os moradores do condominio

  Scenario: novo morador
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And Estou na pagina de morador
    When eu preencho nome 'Antonio', cpf '307.431.250-53', bloco 'A', casanum '7', contato '981000000'
    And clico em Criar Morador
    Then eu vejo que o morador de nome 'Antonio' e cpf '307.431.250-53' foi salvo

  Scenario: novo morador invalido
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And Estou na pagina de morador
    When eu preencho nome 'Pedro', cpf '', bloco 'B', casanum '3', contato '981000021'
    And clico em Criar Morador
    Then eu vejo uma mensagem de cpf deve ser preenchido

  Scenario: novo morador com contato invalido
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And Estou na pagina de morador
    When eu preencho nome 'Joaquim', cpf '919.095.040-25', bloco 'B', casanum '1', contato '789'
    And clico em Criar Morador
    Then eu vejo uma mensagem de contato é muito curto

  Scenario: novo morador invalido
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And Estou na pagina de morador
    When eu preencho nome 'João', cpf '111.115.6', bloco 'A', casanum '2', contato '981474344'
    And clico em Criar Morador
    Then eu vejo uma mensagem de cpf invalido

  Scenario: novo morador cpf existente
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And o morador com o cpf '307.431.250-53' existe
    And estou na pagina de criar morador
    When eu preencho nome 'Sabrino', cpf '307.431.250-53', bloco 'C', casanum '3', contato '999475530'
    And clico em Criar Morador
    Then eu vejo uma mensagem de cpf ja esta em uso

  Scenario: deletar morador
    Given o funcionario com email 'douglas@gmail.com' e senha '123456' existe
    And  o morador com o cpf '307.431.250-53' existe
    And    eu estou na pagina de listagem de morador
    When   eu clico em deletar o morador com cpf '307.431.250-53'
    Then   eu vejo que o morador '307.431.250-53' foi deletado com sucesso