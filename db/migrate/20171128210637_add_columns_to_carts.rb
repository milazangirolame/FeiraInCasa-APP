class AddColumnsToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :state, :string
    add_column :carts, :payment, :jsonb
    add_monetize :carts, :amount, currency: { present: false }
  end
end
