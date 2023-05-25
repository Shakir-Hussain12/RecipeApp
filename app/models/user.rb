class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :foods

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }, allow_blank: false

  def admin?
    role == 'admin'
  end
end
