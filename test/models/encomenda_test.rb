require "test_helper"

class EncomendaTest < ActiveSupport::TestCase
  test "criar encomenda valida" do
    user = User.new(nome:"pepe junior", email:"pepe@email.com.br", tipo:"Funcionario", password:"123456", password_confirmation:"123456")
    assert user.save

    morador = Morador.new(nome:"pepe junior", cpf:"506.766.560-21", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"Amazon", data: "30-12-2021", user_id:user.id, morador_id:morador.id)
    assert encomenda.save
  end

  test "criar encomenda com remetente invalido" do
    user = User.new(nome:"junior pepe", email:"junior@email.com.br", tipo:"Funcionario", password:"123456", password_confirmation:"123456")
    assert user.save

    morador = Morador.new(nome:"junior", cpf:"704.353.730-48", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"", data: "30-12-2021", user_id:user.id, morador_id:morador.id)
    assert_not encomenda.save
  end

  test "excluir encomenda" do
    user = User.new(nome:"zeze junior", email:"zeze@email.com.br", tipo:"Funcionario", password:"123456", password_confirmation:"123456")
    assert user.save

    morador = Morador.new(nome:"junior", cpf:"263.270.290-94", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"Amazon", data: "30-12-2021", user_id:user.id, morador_id:morador.id)
    assert encomenda.save

    assert encomenda.destroy
  end
end
