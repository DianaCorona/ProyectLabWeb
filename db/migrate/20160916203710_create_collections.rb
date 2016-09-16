class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :group, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
