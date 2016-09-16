class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :group, index: true, foreign_key: true
      t.string :message
      t.date :expDate

      t.timestamps null: false
    end
  end
end
