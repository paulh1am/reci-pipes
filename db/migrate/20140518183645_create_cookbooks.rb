class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :title
      t.string :cover_art_url

      t.timestamps
    end
  end
end
