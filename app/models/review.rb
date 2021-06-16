class Review < ApplicationRecord
  belongs_to :meeting

  validates :content, presence: true
  validates :rating, presence: true
end
