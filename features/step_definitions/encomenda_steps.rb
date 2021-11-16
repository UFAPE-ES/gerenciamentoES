Given('eu estou na pagina de nova encomenda') do 
  visit '/encomendas/new'
  expect(page).to have_current_path('/encomendas/new')
end

Given('eu estou na pagina de listagem de encomendas') do 
  visit '/encomendas'
  expect(page).to have_current_path('/encomendas')
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

Given('o funcionario com o nome {string} e email {string} existe') do |nome, email|
  visit 'funcionarios/new'
  fill_in 'funcionario[nome]', with: nome
  fill_in 'funcionario[email]', with: email
  fill_in 'funcionario[senha]', with: '@Test123456'
  fill_in 'funcionario[senha_confirmation]', with: '@Test123456'
  click_button 'Criar Funcionario'
end

When ('eu crio a encomenda com o remetente {string}, data {string}, seleciono o morador {string}, seleciono o funcionario {string}') do |remetente, data, funcionario_id, morador_id|
  fill_in 'encomenda[remetente]', with: remetente
  fill_in 'encomenda[data]', with: data
  select(funcionario_id, from: 'encomenda_funcionario_id')
  select(morador_id, from: 'encomenda_morador_id')
  click_button('Criar encomenda')
end

When('eu altero o nome do remetente para {string}') do |remetente|
  fill_in 'encomenda[remetente]', with: remetente
  click_button('Atualizar encomenda')
end

When('eu clico no botao de deletar {string}') do |remetente, button_name|
  click_link "d-#{remetente}"
  click_button button_name
end

When('eu clico no botao {string} na pergunta de confirmacao') do |button_name|
  click_button button_name
end

Then('eu vejo que a encomenda com remetente {string}, data {string}, morador {string}, funcionario {string} esta na lista de encomendas') do |remetente, data, funcionario_id, morador_id|
  expect(page).to have_content(remetente)
  expect(page).to have_content(data)
  expect(page).to have_content(funcionario_id)
  expect(page).to have_content(morador_id)
end

Then('eu vejo uma mensagem que a encomenda com o remetente alterado para {string}') do |remetente|
  expect(page).to have_content(remetente)
end

Then('eu vejo uma mensagem de erro remetente e muito curto') do
  assert_selector('div#error_explanation', text: 'Nome é muito curto (mínimo: 5 caracteres)')
end

Then ('eu vejo que a encomenda {string} foi removida') do |remetente|
  expect(page).to have_no_content(remetente)
  expect(page).to have_current_path('/encomendas')
end