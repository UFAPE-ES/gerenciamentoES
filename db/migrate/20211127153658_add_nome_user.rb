class AddNomeUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nome, :string
  end
end
