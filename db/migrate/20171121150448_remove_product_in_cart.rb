class RemoveProductInCart < ActiveRecord::Migration[5.1]
  def change
    remove_column :carts, :product_id
  end
end
