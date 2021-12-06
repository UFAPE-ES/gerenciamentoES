Given('o morador com o nome {string} que mora na rua {string} existe') do |nome, rua|
  visit 'moradors/new'
  fill_in 'morador[nome]', :with => nome
  fill_in 'morador[cpf]', :with => "807.212.310-63"
  fill_in 'morador[bloco]', :with => "F"
  fill_in 'morador[casanum]', :with => "157"
  fill_in 'morador[contato]', :with => "981818181"
  fill_in 'morador[endereco_attributes][rua]', :with => rua
  fill_in 'morador[endereco_attributes][complemento]', :with => "testandooo"
  fill_in 'morador[endereco_attributes][cep]', :with => "55435-000"
  click_button 'Criar Morador'
end

Given('Estou na pagina de criar encomenda') do
  visit '/encomendas/new'
end

When('eu crio uma encomenda com remetente {string}, data {string}, seleciono o user {string} e morador de nome {string}') do |remetente, tipo, data, nome|
  fill_in 'encomenda[remetente]', :with => remetente
  fill_in 'encomenda[data]', :with => data
  find('#encomenda_user_id option:first-of-type').select_option
  select nome, from:'encomenda[morador_id]'
end

When('clico em Criar Encomenda') do
  click_button 'Criar Encomenda'
end

Then('vejo uma mensagem encomenda realiza com sucesso') do
  page.has_content?("Encomenda was successfully created.")
end

Then('vejo uma mensagem remetente nao pode ficar em branco') do
  page.has_content?("Remetente não pode ficar em branco")
end

Then('vejo uma mensagem remetente muito curto') do
  page.has_content?("Remetente é muito curto (mínimo: 5 caracteres)")
end

Then('vejo uma mensagem data nao pode ficar em branco') do
  page.has_content?("Data não pode ficar em branco")
end

Then('vejo uma mensagem data nao pode ser no passado') do
  page.has_content?("Data nao pode ser no passado")
end



