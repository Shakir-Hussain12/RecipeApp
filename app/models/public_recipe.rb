class PublicRecipe < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :food, uniqueness: { scope: :recipe_id }
end
