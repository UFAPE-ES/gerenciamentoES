Given('Estou na pagina de morador') do
  visit 'moradors/new'
end

Given('o morador com o cpf {string} existe') do |cpf|
  visit 'moradors/new'
  fill_in 'morador[nome]', :with => "Teste"
  fill_in 'morador[cpf]', :with => cpf
  fill_in 'morador[bloco]', :with => "F"
  fill_in 'morador[casanum]', :with => "157"
  fill_in 'morador[contato]', :with => "981818181"
  click_button 'Criar Morador'
end

Given('eu estou na pagina de listagem de morador') do
  visit '/moradors'
end

When('eu preencho nome {string}, cpf {string}, bloco {string}, casanum {string}, contato {string}') do |nome, cpf, bloco, casanum, telefone|
  fill_in 'morador[nome]', :with => nome
  fill_in 'morador[cpf]', :with => cpf
  fill_in 'morador[bloco]', :with => bloco
  fill_in 'morador[casanum]', :with => casanum
  fill_in 'morador[contato]', :with => telefone
end

When('clico em Criar Morador') do
  click_button 'Criar Morador'
end

When('eu clico em deletar o morador com cpf {string}') do |cpf|
  click_link "d-#{cpf}"
end

Then('eu vejo que o morador de nome {string} e cpf {string} foi salvo') do |nome, cpf|
  page.has_content?(nome)
  page.has_content?(cpf)
end

Then('eu vejo uma mensagem de cpf deve ser preenchido') do
  page.has_content?("Cpf não pode ficar em branco")
end

Then('eu vejo uma mensagem de contato é muito curto') do
  page.has_content?("Contato é muito curto (mínimo: 9 caracteres)")
end

Then('eu vejo uma mensagem de cpf invalido') do
  page.has_content?("Cpf formato ou numero errado")
end

Then('eu vejo uma mensagem de cpf ja esta em uso') do
  page.has_content?("Cpf já está em uso")
end

Then('eu vejo que o morador {string} foi deletado com sucesso') do |cpf|
  expect(page).to have_no_content(cpf)
  expect(page).to have_current_path('/moradors')
end
