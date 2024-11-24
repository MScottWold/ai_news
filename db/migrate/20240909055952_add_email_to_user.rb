class AddEmailToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :email, :string
    add_column :users, :oauth_token, :string
    add_index :users, :oauth_token
  end
end
