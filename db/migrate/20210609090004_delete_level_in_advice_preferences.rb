class DeleteLevelInAdvicePreferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :advice_preferences, :level, :string
  end
end
