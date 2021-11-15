Feature: Funcionario
  As a usuario do sistema de gerenciamento de encomendas
  I want to criar, editar e visualizar cadastro no sistema
  So that eu possa acessar as funcionalidades do sistema

  Scenario: criar funcionario com sucesso
    Given  eu abro a pagina de criacao de funcionario
    When   eu crio o funcionario com o nome 'Pedro', email 'pedro@gmail.com', senha '@Ped123456' e confirmo a senha com '@Ped123456'
    And    eu clico no botao 'Criar Funcionario'
    Then   eu vejo o funcionario com nome 'Pedro', email 'pedro@gmail.com' listado na lista de funcionarios

  Scenario: criar funcionario com confirmacao de senha invalida
    Given  eu abro a pagina de criacao de funcionario
    When   eu crio o funcionario com o nome 'Alexandre', email 'alex@gmail.com', senha '@Alex123456' e confirmo a senha com '@Alex789456'
    And    eu clico no botao 'Criar Funcionario'
    Then   eu vejo uma mensagem de que a confimacao de senha nao e compativel com a senha

  Scenario: criar funcionario com nome invalido
    Given  eu abro a pagina de criacao de funcionario
    When   eu crio o funcionario com o nome 'X', email 'teste@gmail.com', senha '@Teste123456' e confirmo a senha com '@Teste123456'
    When   eu clico no botao 'Criar Funcionario'
    Then   eu vejo uma mensagem que o nome é curto

  Scenario: deletar funcionario com sucesso
    Given  o funcionario com o nome 'Pedro' e email 'pedro@gmail.com' existe
    And    eu estou na pagina de listagem de funcionario
    When   eu clico em deletar o funcionario com nome 'Pedro'
    Then   eu vejo que o funcionario 'Pedro' foi deletado com sucesso

  Scenario: criar funcionario com senha invalida
    Given  eu abro a pagina de criacao de funcionario
    When   eu crio o funcionario com o nome 'Tulio', email 'tulio@gmail.com', senha '12345678' e confirmo a senha com '12345678'
    When   eu clico no botao 'Criar Funcionario'
    Then   eu vejo uma mensagem que a senha nao esta no formato correto
