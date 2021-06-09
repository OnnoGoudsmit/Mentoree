class DeleteAvailabilityIdInAvailabilities < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:availabilities, :availability, foreign_key: true)
  end
end
