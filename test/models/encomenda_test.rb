require "test_helper"

class EncomendaTest < ActiveSupport::TestCase
  test "criar encomenda valida" do
    funcionario = Funcionario.new(nome:"pepe junior", email:"pepe@email.com.br", password:"123456", password_confirmation:"123456")
    assert funcionario.save

    morador = Morador.new(nome:"pepe junior", cpf:"506.766.560-21", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id:morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"Amazon", data: "30-12-2021", funcionario_id:funcionario.id, morador_id:morador.id)
    assert encomenda.save
  end

  test "criar encomenda com remetente invalido" do
    funcionario = Funcionario.new(nome:"junior pepe", email:"junior@email.com.br", password:"123456", password_confirmation:"123456")
    assert funcionario.save

    morador = Morador.new(nome:"junior", cpf:"704.353.730-48", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save
    
    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"", data: "30-12-2021", funcionario_id:funcionario.id, morador_id:morador.id)
    assert_not encomenda.save
  end

  test "criar encomenda sem data" do
    funcionario = Funcionario.new(nome:"zeze junior", email:"zeze@email.com.br", password:"123456", password_confirmation:"123456")
    assert funcionario.save

    morador = Morador.new(nome:"junior", cpf:"263.270.290-94", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save

    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id:morador.id)
    assert endereco.save

    encomenda = Encomenda.new(remetente:"Amazon", data: "", funcionario_id:funcionario.id, morador_id:morador.id)
    assert_not encomenda.save

  end
end
