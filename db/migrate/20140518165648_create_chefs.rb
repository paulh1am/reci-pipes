class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
