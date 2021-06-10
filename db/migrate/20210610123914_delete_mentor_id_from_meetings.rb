class DeleteMentorIdFromMeetings < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key(:meetings, column: :mentor_id)
    remove_column(:meetings, :mentor_id)
  end
end
