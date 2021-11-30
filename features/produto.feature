Feature: Produto
  As a Usuario do sistema de gerenciamento de encomendas
  I want to Criar, editar, visualizar e remover encomendas
  So that Eu possa gerenciar os encomendas do condominio

  Scenario: Adicionar Produto a uma encomenda
    Given o funcionario com email 'pepe@gmail.com' e senha '123456' existe
    And Uma encomenda com o remetente 'Amazon' existe
    When Eu clico em detalhes
    And Eu clico em adicionar produto a encomenda
    When Eu preencho o nome com 'monitor'
    And Eu clico em Criar produto
    Then Eu vejo que o produto de nome 'monitor' foi salvo