class RemoveAddInCart < ActiveRecord::Migration[5.1]
  def change
    remove_column :carts, :add
  end
end
