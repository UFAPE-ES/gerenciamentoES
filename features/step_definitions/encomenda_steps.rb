Given('Estou na pagina de criar encomenda') do
  visit 'encomendas/new'
end

Given('Estou na pagina de listar encomendas') do
  visit 'encomendas'
end

When('Eu preencho o remetente com {string} e a data da entrega com {string}') do |remetente, data_entrega|
  fill_in 'encomenda[remetente]', :with => remetente
  fill_in 'encomenda[data_entrega]', :with => data_entrega
end

When('Eu clico em Criar Encomenda') do
  click_button 'Criar Encomenda'
end

Then('Eu vejo que o remetente de nome {string} e data da entrega {string} foi salvo') do |remetente, data_entrega|
  page.has_content?(remetente)
  page.has_content?(data_entrega)
end

Then('Eu vejo uma mensagem de remetente deve ser preenchido') do
  page.has_content?("Remetente não pode ficar em branco")
end

Then('Eu vejo uma mensagem de data da entrega deve ser preenchido') do
  page.has_content?("Data da entrega não pode ficar em branco")
end

Then('Eu vejo as encomendas listadas') do
  expect(page).to have_content("detalhes")
end

Then('Eu vejo uma mensagem de remetente e muito curto') do
  page.has_content?("Remetente é muito curto (mínimo: 5 caracteres)")
end