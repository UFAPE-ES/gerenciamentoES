Feature: Funcionario
  As a funcionario
  I want to criar e logar funcionario no sistema
  So that eu possa utilizar e sair do sistema

  Scenario: criar funcionario valido
    Given estou na pagina de criar funcionario
    When eu preencho nome 'Sabrino', email 'teste@gmail.com', password 'Adm@123', password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo bem vindo funcionario

  Scenario: criar funcionario com nome invalido
    Given estou na pagina de criar funcionario
    When eu preencho nome 'Sa', email 'teste@gmail.com', password 'Adm@123', password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo uma mensagem nome e muito curto

  Scenario: criar funcionario sem email
    Given estou na pagina de criar funcionario
    When eu preencho nome 'Testando', email '', password 'Teste@123', password confirmation 'Teste@123'
    And clico em sign up
    Then eu vejo uma mensagem email nao pode ficar em branco

  Scenario: criar funcionario com senha invalida
    Given estou na pagina de criar funcionario
    When eu preencho nome 'Testando', email 'testando@gmail.com', password 'Teste@123', password confirmation 'Test@123'
    And clico em sign up
    Then eu vejo uma mensagem password confirmation nao e igual a password

  Scenario: criar funcionario sem senha
    Given estou na pagina de criar funcionario
    When eu preencho nome 'Fabricio', email 'fafa@gmail.com', password '', password confirmation 'Tes1213'
    And clico em sign up
    Then eu vejo uma mensagem password nao pode ficar em branco
