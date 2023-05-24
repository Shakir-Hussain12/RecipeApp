class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :measurement, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
