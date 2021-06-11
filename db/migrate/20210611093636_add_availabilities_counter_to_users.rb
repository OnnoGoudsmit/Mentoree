class AddAvailabilitiesCounterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :availabilities_count, :integer
  end
end
