class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.string :add
      t.string :delivery_address
      t.string :delivery_city
      t.string :delivery_zipcode
      t.date :delivery_date
      t.string :payment_method

      t.timestamps
    end
  end
end
