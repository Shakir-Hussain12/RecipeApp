class AddCountsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :foods_count, :integer, default: 0
    add_column :users, :recipes_count, :integer, default: 0
  end
end
