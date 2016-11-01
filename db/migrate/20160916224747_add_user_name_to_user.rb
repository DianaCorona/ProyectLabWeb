class AddUserNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :userName, :string
  end
end
