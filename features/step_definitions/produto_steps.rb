When('clico em adicionar produto') do
  click_link 'Adicionar produto na encomenda'
end

When('preecho nome do produto {string}') do |nome|
  fill_in 'produto[nome]', :with => nome
end

When('clico em criar produto') do
  click_button 'Criar Produto'
end

Then('vejo a mensagem produto criado com sucesso') do
  page.has_content?('Produto was successfully created.')
end

Then('vejo a mensagem nome do produto e muito curto') do
  page.has_content?('Nome é muito curto (mínimo: 5 caracteres)')
end

Then('vejo a mensagem nome do produto nao pode ficar em branco') do
  page.has_content?('Nome não pode ficar em branco')
end

When('clico no produto de nome {string}') do |nome|
  click_link nome
end

When('clico em editar') do
  click_link 'editar'
end

When('modifico o nome para {string}') do |novoNome|
  fill_in 'produto[nome]', :with => novoNome
end

When('clico em atualizar produto') do
  click_button 'Atualizar Produto'
end

Then('vejo a mensagem produto foi atualizado com sucesso') do
  page.has_content?('Produto was successfully updated.')
end


