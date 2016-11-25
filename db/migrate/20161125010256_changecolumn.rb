class Changecolumn < ActiveRecord::Migration
  def change
    rename_column :groups, :expDate, :exp_date
  end
end
