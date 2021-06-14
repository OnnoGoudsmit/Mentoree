class Industry < ApplicationRecord
  has_many :advice_preferences
  has_many :users_industry, dependent: :destroy
end
