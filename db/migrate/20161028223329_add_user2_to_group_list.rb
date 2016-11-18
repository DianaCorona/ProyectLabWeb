class AddUser2ToGroupList < ActiveRecord::Migration
  def change
    add_reference :group_lists, :user2, index: true, foreign_key: true
  end
end
