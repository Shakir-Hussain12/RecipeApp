class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  validates :name, presence: true, length: { minimum: 5, maximum: 50 }, allow_blank: false

end
