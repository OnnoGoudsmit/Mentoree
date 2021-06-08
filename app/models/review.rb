class Review < ApplicationRecord
  belongs_to :meeting
  belongs_to :user, through: :meetings
end
