class AddNomeAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :nome, :string
  end
end
