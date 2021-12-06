Given('o usuario com email {string} e password {string} existe') do |email, senha|
  visit '/funcionarios/sign_in'
  click_link 'Sign up'
  fill_in 'funcionario[nome]', :with => "Testandoo"
  fill_in 'funcionario[email]', :with => email
  fill_in 'funcionario[password]', :with => senha
  fill_in 'funcionario[password_confirmation]', :with => senha
  click_button 'Sign up'
  click_link 'Sair'
end

Given('estou na pagina de login de funcionario') do
  visit '/funcionarios/sign_in'
  expect(page).to have_current_path('/funcionarios/sign_in')
end

Given('estou na pagina de login de administrador') do
  visit '/admins/sign_in'
  expect(page).to have_current_path('/admins/sign_in')
end

Given('o funcionario com email {string} e password {string} existe') do |email, senha|
  visit '/funcionarios/sign_in'
  click_link 'Sign up'
  fill_in 'funcionario[nome]', :with => "Sabrino"
  fill_in 'funcionario[email]', :with => email
  fill_in 'funcionario[password]', :with => senha
  fill_in 'funcionario[password_confirmation]', :with => senha
  click_button 'Sign up'
  click_link 'Sair'
end

Given('o administrador com nome {string} email {string} e password {string} existe') do |nome, email, senha|
  visit '/admins/sign_in'
  click_link 'Sign up'
  fill_in 'admin[nome]', :with => nome
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
  fill_in 'admin[password_confirmation]', :with => senha
  click_button 'Sign up'

end

When('eu logo com o email {string} e password {string}') do |email, senha|
  visit '/funcionarios/sign_in'
  fill_in 'funcionario[email]', :with => email
  fill_in 'funcionario[password]', :with => senha
  click_button 'Log in'
end

When('eu preencho os campos email {string} e password {string}') do |email, senha|
  fill_in 'funcionario[email]', :with => email
  fill_in 'funcionario[password]', :with => senha
end

When('eu preencho as entradas com email {string} e password {string}') do |email, senha|
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
end

When('clico em log in') do
  click_button 'Log in'
end

When('clico em sair') do
  click_link 'Sair'
end

Then('vejo que o login foi efetuado com sucesso') do
  page.has_content?('Login efetuado com sucesso.')
end

Then('vejo mensagem de email ou senha incorretos') do
  page.has_content?('Email ou senha inválida.')
end

Then('vejo uma mensagem de saiu com sucesso') do
  page.has_content?('Saiu com sucesso.')
end

Then('vejo que o login adm foi efetuado com sucesso') do
  page.has_content?('Perfil Administrador')
end


