Feature: Usuario
  As a usuario
  I want to logar e deslogar do sistema
  So that eu possa utilizar e sair do sistema

  Scenario: criar usuario valido
    Given estou na pagina de criar usuario
    When eu preencho Nome 'Sabrino', Email 'teste@gmail.com', Password 'Adm@123', Password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo Bem vindo Funcionario

  Scenario: criar usuario com nome invalido
    Given estou na pagina de criar usuario
    When eu preencho Nome 'Sa', Email 'teste@gmail.com', Password 'Adm@123', Password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo uma mensagem Nome e muito curto

  Scenario: criar usuario sem email
    Given estou na pagina de criar usuario
    When eu preencho Nome 'Testando', Email '', Password 'Teste@123', Password confirmation 'Teste@123'
    And clico em sign up
    Then eu vejo uma mensagem email nao pode ficar em branco

  Scenario: criar usuario com senha invalida
    Given estou na pagina de criar usuario
    When eu preencho Nome 'Testando', Email 'testando@gmail.com', Password 'Teste@123', Password confirmation 'Test@123'
    And clico em sign up
    Then eu vejo uma mensagem Password confirmation nao e igual a Password

  Scenario: criar usuario sem senha
    Given estou na pagina de criar usuario
    When eu preencho Nome 'Fabricio', Email 'fafa@gmail.com', Password '', Password confirmation 'Tes1213'
    And clico em sign up
    Then eu vejo uma mensagem Password nao pode ficar em branco
