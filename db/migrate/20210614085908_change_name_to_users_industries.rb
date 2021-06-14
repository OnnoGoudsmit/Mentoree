class ChangeNameToUsersIndustries < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_industries, :user_industries
  end
end
