class AddAvailabilityIdInMeetings < ActiveRecord::Migration[6.0]
  def change
    add_reference :availabilities, :availability, foreign_key: true
  end
end
