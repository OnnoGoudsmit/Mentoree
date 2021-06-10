class CreateUsersIndustries < ActiveRecord::Migration[6.0]
  def change
    create_table :users_industries do |t|
      t.text :work_experience
      t.references :user, null: false, foreign_key: true
      t.references :industry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
