class Meeting < ApplicationRecord
  belongs_to :mentoree, class_name: :User, foreign_key: :mentoree_id
  belongs_to :availability

  validate :not_equal
  delegate :mentor, to: :availability

  private

  def not_equal
    if mentoree == mentor
      errors.add(:mentoree_id, "Mentoree can't be the same person as the mentor")
    end
  end
end
