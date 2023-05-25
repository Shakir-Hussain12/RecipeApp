class CreateFoodRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_recipes do |t|
      t.integer :quantity, default: 0
      t.references :food, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
