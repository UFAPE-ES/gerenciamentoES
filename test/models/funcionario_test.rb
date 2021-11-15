require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase
  test "criar funcionario valido" do
    funcionario = Funcionario.new(nome: "junior", email: "zezejunior@email.com", senha: "S&nha123", senha_confirmation: "S&nha123")
    assert funcionario.save
  end

  test "criar funcionario invalido" do
    funcionario = Funcionario.new(nome: "", email: "", senha: "", senha_confirmation: "")
    assert_not funcionario.save
  end

  test "Atualizar funcionario" do
    funcionario = Funcionario.new(nome: "junior", email: "zezejunior@email.com", senha: "S&nha123", senha_confirmation: "S&nha123")
    assert funcionario.save
    assert funcionario.update(name: "zeze junior")
  end
end
