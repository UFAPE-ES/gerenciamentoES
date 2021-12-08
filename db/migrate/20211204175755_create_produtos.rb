class CreateProdutos < ActiveRecord::Migration[6.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.references :encomenda, null: false, foreign_key: true,  on_delete: :cascade
      
      t.timestamps
    end
  end
end
