# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
module Seeds
  def self.run
    admin = Admin.new(nome: 'Doulgas Gerente', email: 'admin@admin.com', password:'123456', password_confirmation:'123456')
    funcionario = User.new(nome:'Vitor Func', email:'teste@gmail.com',tipo:'Funcionario', password:'123456', password_confirmation:'123456')

    admin.save
    funcionario.save
  end
end

Seeds.run