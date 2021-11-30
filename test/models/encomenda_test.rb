require "test_helper"

class EncomendaTest < ActiveSupport::TestCase
  test "criar encomenda valida" do
    user = User.new(nome:"pepe", email:"pepe@email.com.br", tipo:"Funcionario", password:"123456", password_confirmation:"123456")
    assert user.save

    morador = Morador.new(nome:"junior", cpf:"399.373.940-07", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"amazon", data_entrega: "30-12-2021", user_id:user.id, morador_id:morador.id)
    assert encomenda.save
  end

  test "criar encomenda invalida" do
    user = User.new(nome:"junior", email:"junior@email.com.br", tipo:"Funcionario", password:"123456", password_confirmation:"123456")
    assert user.save

    morador = Morador.new(nome:"pepe", cpf:"528.609.450-32", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"", data_entrega: "30-12-2021", user_id:user.id, morador_id:morador.id)
    assert_not encomenda.save
  end

  test "excluir encomenda" do
    user = User.new(nome:"zeze", email:"zeze@email.com.br", tipo:"Funcionario", password:"123456", password_confirmation:"123456")
    assert user.save

    morador = Morador.new(nome:"pepe", cpf:"263.270.290-94", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"", data_entrega: "30-12-2021", user_id:user.id, morador_id:morador.id)
    assert_not encomenda.save

    assert encomenda.destroy
  end
end
