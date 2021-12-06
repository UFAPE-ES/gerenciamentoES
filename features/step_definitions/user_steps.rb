Given('estou na pagina de criar usuario') do
  visit '/users/sign_up'
end

When('eu preencho Nome {string}, Email {string}, Password {string}, Password confirmation {string}') do |nome, email, senha, confirmar_senha|
  fill_in 'user[nome]', :with => nome
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => confirmar_senha
end

When('clico em sign up') do
  click_button 'Sign up'
end

Then('eu vejo Bem vindo Funcionario') do
  expect(page).to have_content("Perfil Funcionario")
end

Then('eu vejo uma mensagem Nome e muito curto') do
  page.has_content?("Nome é muito curto(mínimo: 5 caracteres)")
end

Then('eu vejo uma mensagem email nao pode ficar em branco') do
  page.has_content?("Email não pode ficar em branco")
end

Then('eu vejo uma mensagem Password confirmation nao e igual a Password') do
  page.has_content?("Password confirmation não é igual a Password")
end

Then('eu vejo uma mensagem Password nao pode ficar em branco') do
  page.has_content?("Password não pode ficar em branco")
end
