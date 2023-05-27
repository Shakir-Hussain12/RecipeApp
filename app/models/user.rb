class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }, allow_blank: false

  def admin?
    true 
  end

end
