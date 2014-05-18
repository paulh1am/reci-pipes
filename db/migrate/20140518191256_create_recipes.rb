class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :instrucitons
      t.string :reci

      t.timestamps
    end
  end
end
