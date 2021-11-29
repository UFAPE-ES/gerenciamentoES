require "test_helper"

class EncomendaTest < ActiveSupport::TestCase
  test "criar encomenda valida" do
    user = User.new(nome:"pepe", email:"pepe@mail.com.br", tipo:"Funcionario", password:"admin1", password_confirmation:"admin1")
    assert user.save

    morador = Morador.new(nome:"junior", cpf:"399.373.940-07", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"amazon", data: "29-11-2021", user_id:user.id, morador_id:morador.id)
    assert encomenda.save
  end

  test "criar encomenda invalida" do
    user = User.new(nome:"junior", email:"junior@mail.com.br", tipo:"Funcionario", password:"admin1", password_confirmation:"admin1")
    assert user.save

    morador = Morador.new(nome:"pepe", cpf:"528.609.450-32", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"", data: "29-11-2021", user_id:user.id, morador_id:morador.id)
    assert_not encomenda.save
  end

  test "excluir encomenda" do
    user = User.new(nome:"zeze", email:"zeze@mail.com.br", tipo:"Funcionario", password:"admin1", password_confirmation:"admin1")
    assert user.save

    morador = Morador.new(nome:"pepe", cpf:"263.270.290-94", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"", data: "29-11-2021", user_id:user.id, morador_id:morador.id)
    assert_not encomenda.save

    assert encomenda.destroy
  end
end
