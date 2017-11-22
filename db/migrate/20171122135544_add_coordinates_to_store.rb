class AddCoordinatesToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :latitude, :float
    add_column :stores, :longitude, :float
  end
end
