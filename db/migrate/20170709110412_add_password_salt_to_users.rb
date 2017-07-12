class AddPasswordSaltToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_salt, :string, after: :encrypted_password
  end
end
