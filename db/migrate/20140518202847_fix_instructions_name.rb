class FixInstructionsName < ActiveRecord::Migration
  def change
    rename_column :recipes, :instrucitons, :instructions 
  end
end
