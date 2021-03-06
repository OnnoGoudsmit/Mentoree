class Meeting < ApplicationRecord
  belongs_to :mentoree, class_name: :User, foreign_key: :mentoree_id
  belongs_to :availability
  has_one :chatroom, dependent: :destroy
  has_many :reviews, dependent: :destroy

  after_create :create_chatroom

  validate :not_equal
  delegate :mentor, to: :availability

  private

  def not_equal
    if mentoree == mentor
      errors.add(:mentoree_id, "Mentoree can't be the same person as the mentor")
    end
  end

  def create_chatroom
    Chatroom.create(name: "chat-#{id}", meeting: self) # <= same as self.id, we assoicate a chatroom with a meeting
  end
end
