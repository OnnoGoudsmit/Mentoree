class Availability < ApplicationRecord
  belongs_to :meeting
  belongs_to :user, counter_cache: true
end
