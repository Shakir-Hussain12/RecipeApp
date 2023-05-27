class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :public_recipes, :quanitity, :quantity
  end
end
