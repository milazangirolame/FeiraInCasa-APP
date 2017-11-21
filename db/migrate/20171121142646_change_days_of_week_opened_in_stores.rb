class ChangeDaysOfWeekOpenedInStores < ActiveRecord::Migration[5.1]
  def change
    change_column :stores, :days_of_week_opened, :text
  end
end
