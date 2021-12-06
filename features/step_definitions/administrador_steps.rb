Given('estou na pagina de criar administrador') do
  visit '/admins/sign_up'
end

When('eu preencho os campos nome {string}, email {string}, password {string}, password confirmation {string}') do |nome, email, senha, confirmar_senha|
  fill_in 'admin[nome]', :with => nome
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
  fill_in 'admin[password_confirmation]', :with => confirmar_senha
end
Then('eu vejo o perfil admin') do
  page.has_content?("Perfil Administrador")
end
