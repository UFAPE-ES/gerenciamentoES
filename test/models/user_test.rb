require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "criar user do tipo funcionario" do
    user = User.new(nome:'admin', email:'admin@admin.com', tipo:'Administrador', password:'admin1', password_confirmation:'admin1')
    assert user.save
  end

  test "criar user invalido" do
    user = User.new(nome:'pepe', email:'pepe@email.com', tipo:'Administrador', password:'admin1', password_confirmation:'admin1')
    assert_not user.save
  end

  test "Atualizar user" do
    user = User.new(nome:'pepe junior', email:'junior@email.com', tipo:'Funcionario', password:'admin1', password_confirmation:'admin1')
    assert user.save
    
    assert user.update(nome: "zeze junior")
  end
end
