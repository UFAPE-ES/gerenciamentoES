Given ('o funcionario com email {string} e senha {string} existesssss') do |email,senha|
  visit '/funcionarios/sign_in'
  click_link 'Sign up'
  fill_in 'funcionario[nome]', :with => 'testes'
  fill_in 'funcionario[email]', :with => email
  fill_in 'funcionario[password]', :with => senha
  fill_in 'funcionario[password_confirmation]', :with => senha
  click_button 'Sign up'
  expect(page).to have_content("Funcionario")
end