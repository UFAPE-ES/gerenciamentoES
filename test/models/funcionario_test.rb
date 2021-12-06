require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase
  test "criar funcionario do tipo funcionario" do
    funcionario = Funcionario.new(nome:'admin', email:'admin@admin.com', password:'admin1', password_confirmation:'admin1')
    assert funcionario.save
  end

  test "criar funcionario invalido" do
    funcionario = Funcionario.new(nome:'pepe', email:'pepe@email.com', password:'admin1', password_confirmation:'admin1')
    assert_not funcionario.save
  end

  test "Atualizar funcionario" do
    funcionario = Funcionario.new(nome:'pepe junior', email:'junior@email.com', password:'admin1', password_confirmation:'admin1')
    assert funcionario.save
    
    assert funcionario.update(nome: "zeze junior")
  end
end
