class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.datetime :start_time
      t.text :prep_content
      t.references :mentor, index: true, foreign_key: {to_table: :users}
      t.references :mentoree, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
