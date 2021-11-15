Given ('eu abro a pagina de criacao de funcionario') do
  visit 'funcionarios/new'
end

Given ('eu estou na pagina de listagem de funcionario') do
  visit '/funcionarios'
end

Given ('o funcionario com o nome {string} e email {string} existe') do |nome,email|
  visit 'funcionarios/new'
  fill_in 'funcionario[nome]', with: nome
  fill_in 'funcionario[email]', with: email
  fill_in 'funcionario[senha]', with: '@Test123456'
  fill_in 'funcionario[senha_confirmation]', with: '@Test123456'
  click_button 'Criar Funcionario'
end


When('eu crio o funcionario com o nome {string}, email {string}, senha {string} e confirmo a senha com {string}') do |nome,email,senha,senha_confirmation|
  fill_in 'funcionario[nome]', with: nome
  fill_in 'funcionario[email]', with: email
  fill_in 'funcionario[senha]', with: senha
  fill_in 'funcionario[senha_confirmation]', with: senha_confirmation
end

When ('eu clico em deletar o funcionario com nome {string}') do |nome|
  click_link "d-#{nome}"
end

When('eu clico no botao {string}') do |button_name|
  click_button button_name
end

Then ('eu vejo o funcionario com nome {string}, email {string} listado na lista de funcionarios') do |nome,email|
  expect(page).to have_content(nome)
  expect(page).to have_content(email)
end

Then ('eu vejo uma mensagem de que a confimacao de senha nao e compativel com a senha') do
  assert_selector('div#error_explanation', text: 'Confirmação de senha não é igual a Senha')
end

Then ('eu vejo uma mensagem que o nome é curto') do
  assert_selector('div#error_explanation', text: 'Nome é muito curto (mínimo: 5 caracteres)')
end

Then ('eu vejo uma mensagem que a senha nao esta no formato correto') do
  assert_selector('div#error_explanation', text: 'Senha deve conter letra maiuscula')
  assert_selector('div#error_explanation', text: 'Senha deve conter letra minuscula')
  assert_selector('div#error_explanation', text: 'Senha deve conter caractere especial (ex: @,$,...)')
end

Then ('eu vejo que o funcionario {string} foi deletado com sucesso') do |nome|
  expect(page).to have_no_content(nome)
  expect(page).to have_current_path('/funcionarios')
end

