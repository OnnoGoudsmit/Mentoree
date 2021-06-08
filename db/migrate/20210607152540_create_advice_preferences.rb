class CreateAdvicePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :advice_preferences do |t|
      t.references :industry, null: false, foreign_key: true
      t.string :subject
      t.string :level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
