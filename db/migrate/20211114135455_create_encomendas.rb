class CreateEncomendas < ActiveRecord::Migration[6.1]
  def change
    create_table :encomendas do |t|
      t.string :remetente
      t.date :data
      t.references :user, null: false, foreign_key: true,  on_delete: :cascade
      t.references :morador, null: false, foreign_key: true,  on_delete: :cascade

      t.timestamps
    end
  end
end
