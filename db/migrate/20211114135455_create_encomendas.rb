class CreateEncomendas < ActiveRecord::Migration[6.1]
  def change
    create_table :encomendas do |t|
      t.string :remetente
      t.date :data
      t.references :funcionario, null: false, foreign_key: true
      t.references :morador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
