Feature: Administrador
  As a Administrador
  I want to logar e deslogar do sistema
  So that eu possa utilizar e sair do sistema

  Scenario: criar administrador valido
    Given estou na pagina de criar administrador
    When eu preencho os campos nome 'Sabrino', email 'teste@gmail.com', password 'Adm@123', password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo o perfil admin

  Scenario: criar admin com nome invalido
    Given estou na pagina de criar administrador
    When eu preencho os campos nome 'Te', email 'teste@gmail.com', password 'Adm@123', password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo uma mensagem nome e muito curto

  Scenario: criar admin sem email
    Given estou na pagina de criar administrador
    When eu preencho os campos nome 'Matheus', email '', password 'Adm@123', password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo uma mensagem email nao pode ficar em branco

  Scenario: criar admin com senha invalida
    Given estou na pagina de criar administrador
    When eu preencho os campos nome 'Matheus', email 'matheus@gmail.com', password 'Teste@123', password confirmation 'Test@123'
    And clico em sign up
    Then eu vejo uma mensagem password confirmation nao e igual a password

  Scenario: criar admin sem senha
    Given estou na pagina de criar administrador
    When eu preencho os campos nome 'Aldo', email 'aldo@gmail.com', password '', password confirmation 'Ald@o123'
    And clico em sign up
    Then eu vejo uma mensagem password nao pode ficar em branco
