class Recipe < ApplicationRecord
  belongs_to :user
  has_many :public_recipes
  has_many :foods, through: :public_recipes

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }, allow_blank: false
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }, allow_blank: false
  validates :public, inclusion: { in: [true, false] }

  after_save :update_count

  private

  def update_count
    user.update(foods_count: user.foods.count)
  end
end
