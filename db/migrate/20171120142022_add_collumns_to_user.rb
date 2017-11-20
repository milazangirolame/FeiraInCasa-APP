class AddCollumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :cpf, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zipcode, :string
  end
end
