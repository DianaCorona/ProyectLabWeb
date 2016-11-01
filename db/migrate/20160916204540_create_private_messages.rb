class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.references :privateConversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
