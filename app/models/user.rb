class User < ApplicationRecord
  has_many :recipes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
end
