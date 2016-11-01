class CreatePublicMessages < ActiveRecord::Migration
  def change
    create_table :public_messages do |t|
      t.references :chat, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
