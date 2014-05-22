class CreateChatsTable < ActiveRecord::Migration
  def change
    create_table :chats_tables do |t|
      t.string :call
      t.string :reply
    end
  end
end
