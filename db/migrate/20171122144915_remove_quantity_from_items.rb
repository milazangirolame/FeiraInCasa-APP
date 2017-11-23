class RemoveQuantityFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :quantity, :string
  end
end
