class UserIndustry < ApplicationRecord
  belongs_to :user
  belongs_to :industry
end
