class CreateChatMembers < ActiveRecord::Migration
  def change
    create_table :chat_members do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user2, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
