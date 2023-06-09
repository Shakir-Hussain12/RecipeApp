class Food < ApplicationRecord
  belongs_to :user
  has_many :public_recipes, dependent: :destroy

  validates :name, presence: true
  validates :measurement, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_count

  private

  def update_count
    user.update(foods_count: user.foods.size)
  end
end
