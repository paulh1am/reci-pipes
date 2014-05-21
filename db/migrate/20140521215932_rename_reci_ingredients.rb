class RenameReciIngredients < ActiveRecord::Migration
  def change
    rename_column :recipes, :reci, :ingredients
  end
end
