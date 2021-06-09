class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meetings
  has_many :reviews, through: :meetings
<<<<<<< HEAD
  has_one_attached :photo
=======
  has_many :advice_preferences
  has_many :industries, through: :advice_preferences
  has_many :availabilities

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, comparison: { greater_than: 16 }
  validates :city, presence: true
  validates :phone_number, presence: true
  validates :about, presence: true, length: { minimum: 25 }
  validates :resume, presence: true, length: { minimum: 25 }
>>>>>>> master
end
