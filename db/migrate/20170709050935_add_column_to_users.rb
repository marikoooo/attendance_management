class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :string
    add_column :users, :gender, :string
    add_column :users, :contract, :string
    add_column :users, :address, :string
    add_column :users, :phone, :integer
  end
end
