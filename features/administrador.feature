Feature: Administrador
  As a Administrador
  I want to logar e deslogar do sistema
  So that eu possa utilizar e sair do sistema

  Scenario: criar administrador valido
    Given estou na pagina de criar administrador
    When eu preencho email 'admin01@gmail.com', password 'Adm@123', password confirmation 'Adm@123'
    And clico em sign up
    Then eu vejo Bem vindo Funcionario