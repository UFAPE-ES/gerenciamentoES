Feature: Acesso
  As a usuario
  I want to entrar e sair do sistema
  So that eu possa utilizar e sair do sistema

  Scenario: login valido como funcionario
    Given o funcionario com email 'funcionario@gmail.com' e password 'Func@123' existe
    And estou na pagina de login de funcionario
    When eu preencho os campos email 'funcionario@gmail.com' e password 'Func@123'
    And clico em log in
    Then vejo que o login foi efetuado com sucesso

  Scenario: login de funcionario com senha incorreta
    Given o funcionario com email 'funcionario02@gmail.com' e password 'Func@154' existe
    And estou na pagina de login de funcionario
    When eu preencho os campos email 'funcionario02@gmail.com' e password 'Func@123'
    And clico em log in
    Then vejo mensagem de email ou senha incorretos

  Scenario: logout de funcionario
    Given o funcionario com email 'funcionario@gmail.com' e password 'Func@123' existe
    And estou na pagina de login de funcionario
    When eu logo com o email 'funcionario@gmail.com' e password 'Func@123'
    And clico em sair
    Then vejo uma mensagem de saiu com sucesso

  Scenario: login de funcionario com email incorreto
    Given o usuario com email 'funcionario02@gmail.com' e password 'Func@123' existe
    And estou na pagina de login de funcionario
    When eu preencho os campos email 'funcionario@gmail.com' e password 'Func@123'
    And clico em log in
    Then vejo mensagem de email ou senha incorretos

  Scenario: login valido como adm
    Given o administrador com nome 'admin' email 'admin@admin.com' e password 'adm1' existe
    And estou na pagina de login de administrador
    When eu preencho as entradas com email 'admin@admin.com' e password 'adm1'
    And clico em log in
    Then vejo que o login adm foi efetuado com sucesso
