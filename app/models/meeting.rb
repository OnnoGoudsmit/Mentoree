class Meeting < ApplicationRecord
  belongs_to :mentoree, class_name: :User, foreign_key: :mentoree_id
  belongs_to :mentor, class_name: :User, foreign_key: :mentor_id
  belongs_to :availability
end
