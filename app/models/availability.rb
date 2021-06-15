class Availability < ApplicationRecord
  has_one :meeting
  belongs_to :user, foreign_key: :mentor_id, counter_cache: true
  # belongs_to :mentor, class_name: "User"

  # def self.format_slot
  #   map { |slot| slot.strftime("%a %d %b %n %R") }
  # end
  # availability.format_slot
end
