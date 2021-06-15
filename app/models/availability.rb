class Availability < ApplicationRecord
  has_one :meeting
  belongs_to :user, foreign_key: :mentor_id, counter_cache: true
  # belongs_to :mentor, class_name: "User"

  def mentor
    user
  end

  def format_time
    "#{slot.strftime('%a %d %b')}<br>#{slot.strftime('%R')}".html_safe
  end
end
