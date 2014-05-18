class AddChefIdToCookbook < ActiveRecord::Migration
  def change
    add_column :cookbooks, :chef_id, :integer
  end
end
