require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase
  test "criar funcionario valido" do
    funcionario = Funcionario.new(nome: "zeze", email: "zeze@email.com", senha: "S&nha123", senha_confirma: "S&nha123")
    assert funcionario.save
  end

  test "criar funcionario invalido" do
    funcionario = Funcionario.new(nome: "", email: "", senha: "", senha_confirma: "")
    assert_not funcionario.save
  end

  test "Atualizar funcionario" do
    funcionario = Funcionario.new(nome: "zeze", email: "zeze@email.com", senha: "S&nha123", senha_confirma: "S&nha123")
    assert funcionario.save
    assert funcionario.update(name: "zeze junior")
  end
end
