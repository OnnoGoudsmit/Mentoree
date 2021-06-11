class Availability < ApplicationRecord
  has_one :meeting
  belongs_to :user, foreign_key: :mentor_id, counter_cache: true
  # belongs_to :mentor, class_name: "User"
end
