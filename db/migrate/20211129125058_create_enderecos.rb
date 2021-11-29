class CreateEnderecos < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :rua
      t.string :complemento
      t.string :cep
      t.references :morador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
