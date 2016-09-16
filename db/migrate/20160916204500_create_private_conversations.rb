class CreatePrivateConversations < ActiveRecord::Migration
  def change
    create_table :private_conversations do |t|
      t.datetime :date
      t.references :contact, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
