class AddCookBookIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cookbook_id, :integer
  end
end
