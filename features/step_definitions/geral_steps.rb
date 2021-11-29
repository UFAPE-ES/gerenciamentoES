Given ('o funcionario com email {string} e senha {string} existe') do |email,senha|
  visit '/users/sign_in'
  click_link 'Sign up'
  fill_in 'user[nome]', :with => 'testes'
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => senha
  click_button 'Sign up'
  expect(page).to have_content("Funcionario")
end