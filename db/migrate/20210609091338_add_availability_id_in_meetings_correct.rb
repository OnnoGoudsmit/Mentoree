class AddAvailabilityIdInMeetingsCorrect < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :availability, foreign_key: true
  end
end
