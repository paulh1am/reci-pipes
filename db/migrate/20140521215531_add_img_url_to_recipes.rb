class AddImgUrlToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :img_url, :string
  end
end
