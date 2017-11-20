class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :unity
      t.integer :store_id


      t.timestamps
    end
  end
end
