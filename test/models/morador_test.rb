require "test_helper"

class MoradorTest < ActiveSupport::TestCase
  test "criar morador valido" do
    morador = Morador.new(nome:"junior", cpf:"160.057.920-59", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save

    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save
  end

  test "criar morador invalido" do
    morador = Morador.new(nome:"", cpf:"048.639.730-04", contato:"999999999", bloco:"A", casanum:"01")
    assert_not morador.save

    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert_not endereco.save
  end

  test "Atualizar morador" do
    morador = Morador.new(nome:"junior", cpf:"847.843.610-30", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save

    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save
    
    assert morador.update(nome: "zeze junior")
  end
end
