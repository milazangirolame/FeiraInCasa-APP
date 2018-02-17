class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zipcode
      t.time :opened_time
      t.time :closed_time
      t.string :days_of_week_opened
      t.boolean :delivery_product
      t.integer :maximum_distance_to_deliver_km
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
