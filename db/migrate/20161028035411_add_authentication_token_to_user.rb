class AddAuthenticationTokenToUser < ActiveRecord::Migration
  def change
    add_column :user2s, :authentication_token, :string
  end
end
