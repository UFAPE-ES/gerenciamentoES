require "test_helper"

class ProdutoTest < ActiveSupport::TestCase
  test "criar produto valido" do
    user = User.new(nome:"pepe", email:"pepe@gmail.com", tipo:"Funcionario", password:"admin1", password_confirmation:"admin1")
    assert user.save

    morador = Morador.new(nome:"junior", cpf:"543.676.570-00", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"amazon", data: "29-11-2021", user_id:user.id, morador_id:morador.id)
    assert encomenda.save

    produto = Produto.new(nome:"monitor", encomenda_id:encomenda.id)
    assert produto.save
  end

  test "criar produto com dado valido" do
    user = User.new(nome:"junior", email:"junior@gmail.com", tipo:"Funcionario", password:"admin1", password_confirmation:"admin1")
    assert user.save

    morador = Morador.new(nome:"pepe", cpf:"995.629.430-62", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"amazon", data: "29-11-2021", user_id:user.id, morador_id:morador.id)
    assert encomenda.save

    produto = Produto.new(nome:"", encomenda_id:encomenda.id)
    assert_not produto.save
  end

  test "atualizar produto" do
    user = User.new(nome:"zeze", email:"zeze@gmail.com", tipo:"Funcionario", password:"admin1", password_confirmation:"admin1")
    assert user.save

    morador = Morador.new(nome:"pepe", cpf:"485.860.560-49", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"amazon", data: "29-11-2021", user_id:user.id, morador_id:morador.id)
    assert encomenda.save

    produto = Produto.new(nome:"", encomenda_id:encomenda.id)
    assert produto.save

    assert produto.update(nome: "amazon br")
  end
end
