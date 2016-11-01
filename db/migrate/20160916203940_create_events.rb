class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :calendar, index: true, foreign_key: true
      t.string :name
      t.date :date
      t.string :description
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
