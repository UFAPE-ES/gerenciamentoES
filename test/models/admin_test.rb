require "test_helper"

class AdminTest < ActiveSupport::TestCase
  test 'admin sem nome' do
    admin = Admin.new(nome: '', email: 'admin002@admin.com', password:'123456', password_confirmation:'123456')
    assert_not admin.save
  end

  test 'admin valido' do
    admin = Admin.new(nome: 'Tonhao', email: 'admin002@admin.com', password:'123456', password_confirmation:'123456')
    assert admin.save
  end

  test 'admin sem email ' do
    admin = Admin.new(nome: 'Tonhao', email: '', password:'123456', password_confirmation:'123456')
    assert_not admin.save
  end

end
