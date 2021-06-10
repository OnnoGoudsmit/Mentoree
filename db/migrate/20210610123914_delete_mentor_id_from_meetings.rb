class DeleteMentorIdFromMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:meetings, :mentor, foreign_key: true)
  end
end
