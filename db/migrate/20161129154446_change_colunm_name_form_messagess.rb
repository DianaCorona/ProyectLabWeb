class ChangeColunmNameFormMessagess < ActiveRecord::Migration
  def change
  	remove_column :messages, :chat_member_id
  	add_reference :messages, :user2, foreign_key: true
  end
end
