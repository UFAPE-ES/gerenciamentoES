Given('estou na pagina de criar funcionario') do
  visit '/funcionarios/sign_up'
end

When('eu preencho nome {string}, email {string}, password {string}, password confirmation {string}') do |nome, email, senha, confirmar_senha|
  fill_in 'funcionario[nome]', :with => nome
  fill_in 'funcionario[email]', :with => email
  fill_in 'funcionario[password]', :with => senha
  fill_in 'funcionario[password_confirmation]', :with => confirmar_senha
end

When('clico em sign up') do
  click_button 'Sign up'
end

Then('eu vejo bem vindo funcionario') do
  expect(page).to have_content("Perfil Funcionario")
end

Then('eu vejo uma mensagem nome e muito curto') do
  page.has_content?("Nome é muito curto(mínimo: 5 caracteres)")
end

Then('eu vejo uma mensagem email nao pode ficar em branco') do
  page.has_content?("Email não pode ficar em branco")
end

Then('eu vejo uma mensagem password confirmation nao e igual a password') do
  page.has_content?("Password confirmation não é igual a Password")
end

Then('eu vejo uma mensagem password nao pode ficar em branco') do
  page.has_content?("Password não pode ficar em branco")
end
