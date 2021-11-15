require "test_helper"

class MoradorTest < ActiveSupport::TestCase
  test "criar morador valido" do
    morador = Morador.new(nome: "zeze", cpf: "111.111.111-00", contato: "(81)99999-9999", bloco: "A", casanum: "01")
    assert morador.save
  end

  test "criar morador invalido" do
    morador = Morador.new(nome: "zeze", cpf: "111.111.111-00", contato: "(81)99999-9999", bloco: "A", casanum: "01")
    assert morador.save
  end

  test "Atualizar morador" do
    morador = Morador.new(nome: "zeze", cpf: "111.111.111-00", contato: "(81)99999-9999", bloco: "A", casanum: "01")
    assert morador.save
    assert morador.update(name: "zeze junior")
  end
end
