class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :chat_member, index: true, foreign_key: true
      t.references :chat, index: true, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
