class CreateMoradors < ActiveRecord::Migration[6.1]
  def change
    create_table :moradors do |t|
      t.string :nome
      t.string :cpf
      t.string :bloco
      t.string :casanum
      t.string :contato

      t.timestamps
    end
  end
end
