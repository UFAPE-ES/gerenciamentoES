Feature: Acesso
  As a usuario
  I want to entrar e sair do sistema
  So that eu possa utilizar e sair do sistema

  Scenario: login valido como funcionario
    Given o funcionario com Email 'funcionario@gmail.com' e Password 'Func@123' existe
    And estou na pagina de login
    When eu preencho os campos Email 'funcionario@gmail.com' e Password 'Func@123'
    And clico em log in
    Then vejo que o login foi efetuado com sucesso

  Scenario: login de usuario com senha incorreta
    Given o usuario com Email 'funcionario02@gmail.com' e Password 'Func@154' existe
    And estou na pagina de login
    When eu preencho os campos Email 'funcionario02@gmail.com' e Password 'Func@123'
    And clico em log in
    Then vejo mensagem de email ou senha incorretos

  Scenario: logout de usuario
    Given o usuario com Email 'funcionario@gmail.com' e Password 'Func@123' existe
    And estou na pagina de login
    When eu logo com o Email 'funcionario@gmail.com' e Password 'Func@123'
    And clico em Sair
    Then vejo uma mensagem de saiu com sucesso

  Scenario: login de usuario com email incorreto
    Given o usuario com Email 'funcionario02@gmail.com' e Password 'Func@123' existe
    And estou na pagina de login
    When eu preencho os campos Email 'funcionario@gmail.com' e Password 'Func@123'
    And clico em log in
    Then vejo mensagem de email ou senha incorretos

  Scenario: login valido como adm
    Given o administrador com nome 'admin' Email 'admin@admin.com' e Password 'adm1' existe
    And estou na pagina de login
    When eu preencho os campos Email 'admin@admin.com' e Password 'adm1'
    And clico em log in
    Then vejo que o login adm foi efetuado com sucesso
