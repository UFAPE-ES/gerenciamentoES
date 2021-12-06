require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  test "criar endereco valido" do
    morador = Morador.new(nome:"junior", cpf:"904.238.470-07", contato:"999999999", bloco:"A", casanum:"01")
    assert morador.save

    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save
  end

  test "atualizar endereco" do
    morador = Morador.new(nome:"junior", cpf:"373.400.330-09", contato:"999999999", bloco:"B", casanum:"02")
    assert morador.save

    endereco = Endereco.new(rua:"rua central", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert endereco.save

    assert morador.endereco.update(rua:"avenida central")
  end

  test "criar endereco com dado invalido" do
    morador = Morador.new(nome:"junior", cpf:"661.628.710-61", contato:"999999999", bloco:"C", casanum:"03")
    assert morador.save
    
    endereco = Endereco.new(rua:"", complemento:"centro", cep:"55380-000", morador_id: morador.id)
    assert_not endereco.save
  end
end
