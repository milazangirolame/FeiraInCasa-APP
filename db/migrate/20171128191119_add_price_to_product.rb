class AddPriceToProduct < ActiveRecord::Migration[5.1]
  def change
    add_monetize :products, :price, currency: { present: false }
  end
end
