class Industry < ApplicationRecord
  has_many :advice_preferences
  has_many :user_industries, dependent: :destroy
end
