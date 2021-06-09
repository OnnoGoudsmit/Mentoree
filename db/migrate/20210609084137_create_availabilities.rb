class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :mentor, index: true, foreign_key: {to_table: :users}
      t.datetime :slot

      t.timestamps
    end
  end
end
