class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meetings
  has_many :reviews, through: :meetings

  has_one_attached :photo

  has_many :advice_preferences
  has_many :industries, through: :advice_preferences
  has_many :availabilities, foreign_key: :mentor_id, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { greater_than: 16 }, unless: :new_record?
  validates :city, presence: true, unless: :new_record?

  validates :phone_number, presence: true, unless: :new_record?
  validates :about, presence: true, length: { minimum: 25 }, unless: :new_record?

  # add the rest of the validation once the first form is done.

  def user_to_complete_profile
    # if self.city.first_name.etc? returns true if city is present
    # if self.attributes # => gives back a hash with key as attribute and value as nil or value
    self.attributes.each do |attr|
      return false if self[attr].nil?
    end
  end

  def user_to_complete_advice_preference
    self.advice_preferences.attributes.each do |attr|
      return false if self[attr].nil?
    end
  end

  def user_to_complete_user_indsutries
    self.user_industries.attributes.each do |attr|
      return false if self[attr].nil?
    end
  end

  scope :mentors, -> { where("availabilities_count > 0") }

  def get_slots
    self.availabilities.where('slot > ?', DateTime.now).limit(3)
  end
end
