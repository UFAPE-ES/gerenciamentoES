Given('Estou na pagina de criar encomenda') do
  visit 'encomendas'
end

Given('Uma encomenda com o remetente {string} existe') do |remetente|
  page.has_content?(remetente)
end

Then('Eu vejo que o produto de nome {string} foi salvo') do |nome|
  page.has_content?(nome)
end

When('Eu preencho o nome com {string}') do |nome|
  fill_in 'produto[nome]', :with => nome
end

When('Eu clico em detalhes') do
  click_button 'detalhes'
end

When('Eu clico em adicionar produto a encomenda') do
  click_button 'adicionar produto a encomenda'
end

When('Eu clico em Criar produto') do
  click_button 'Criar produto'
end