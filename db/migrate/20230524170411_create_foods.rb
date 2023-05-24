class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement
      t.decimal :price
      t.integer :quantity, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
