require "test_helper"

class EncomendaTest < ActiveSupport::TestCase
  test "criar encomenda valida" do
    funcionario = Funcionario.new(nome: "zeze", email: "zeze@email.com", senha: "S&nha123", senha_confirmation: "S&nha123")
    assert funcionario.save

    morador = Morador.new(nome: "zeze", cpf: "111.111.111-00", contato: "(81)99999-9999", bloco: "A", casanum: "01")
    assert morador.save

    encomenda = Encomenda.new(remetente: "amazon", data: "01-10-2021", funcionario_id: funcionario.id, morador_id: morador.id)
    assert encomenda.save
  end

  test "criar encomenda invalida" do
    funcionario = Funcionario.new(nome: "zeze", email: "zeze@email.com", senha: "S&nha123", senha_confirmation: "S&nha123")
    assert funcionario.save

    morador = Morador.new(nome: "zeze", cpf: "111.111.111-00", contato: "(81)99999-9999", bloco: "A", casanum: "01")
    assert morador.save

    encomenda = Encomenda.new(remetente: "", data: "", funcionario_id: funcionario.id, morador_id: morador.id)
    assert encomenda.save
  end

  test "excluir encomenda" do
    funcionario = Funcionario.new(nome: "zeze", email: "zeze@email.com", senha: "S&nha123", senha_confirmation: "S&nha123")
    assert funcionario.save

    morador = Morador.new(nome: "zeze", cpf: "111.111.111-00", contato: "(81)99999-9999", bloco: "A", casanum: "01")
    assert morador.save

    encomenda = Encomenda.new(remetente: "amazon", data: "01-10-2021", funcionario_id: funcionario.id, morador_id: morador.id)
    assert encomenda.save

    assert encomenda.destroy
  end
end
