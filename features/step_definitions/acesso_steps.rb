Given('o usuario com Email {string} e Password {string} existe') do |email, senha|
  visit '/users/sign_in'
  click_link 'Sign up'
  fill_in 'user[nome]', :with => "Testandoo"
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => senha
  click_button 'Sign up'
  click_link 'Sair'
end

Given('estou na pagina de login') do
  visit '/users/sign_in'
  expect(page).to have_current_path('/users/sign_in')
end

Given('o funcionario com Email {string} e Password {string} existe') do |email, senha|
  visit '/users/sign_in'
  click_link 'Sign up'
  fill_in 'user[nome]', :with => "Sabrino"
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => senha
  click_button 'Sign up'
  click_link 'Sair'
end

Given('o administrador com nome {string} Email {string} e Password {string} existe') do |nome, email, senha|
  visit '/users/sign_in'
  click_link 'Sign up'
  fill_in 'user[nome]', :with => nome
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => senha
  find_field(id: 'id_tipo', type: :hidden).set('Administrador')
  click_button 'Sign up'

end

When('eu logo com o Email {string} e Password {string}') do |email, senha|
  visit '/users/sign_in'
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  click_button 'Log in'
end


When('eu preencho os campos Email {string} e Password {string}') do |email, senha|
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
end

When('clico em log in') do
  click_button 'Log in'
end

When('clico em Sair') do
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
  page.has_content?('Bem vindo Administrador')
end


