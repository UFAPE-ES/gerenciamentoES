# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
module Seeds
  def self.run
    user = User.new(nome:'admin', email:'admin@admin.com',tipo:'Administrador', password:'admin1', password_confirmation:'admin1')
    funcionario = User.new(nome:'funcionario', email:'teste@gmail.com',tipo:'Funcionario', password:'123456', password_confirmation:'123456')

    funcionario.save
    user.save
  end
end

Seeds.run