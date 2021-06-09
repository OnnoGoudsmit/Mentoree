class DeleteStartTimeInMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :start_time, :datetime
  end
end
