class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :name, :string
  end
end
