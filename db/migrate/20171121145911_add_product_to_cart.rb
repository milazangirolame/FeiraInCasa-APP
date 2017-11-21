class AddProductToCart < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :product, foreign_key: true
  end
end
