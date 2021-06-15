class Industry < ApplicationRecord
  has_many :advice_preferences, dependent: :destroy
  has_many :user_industries, dependent: :destroy
end
