class NewUsersFields < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sex, :string
    add_column :users, :avatar, :string
    add_column :users, :kilometers, :integer
    add_column :users, :phone, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :visits_count, :integer
    add_column :users, :telegram, :string
    add_column :users, :vk, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :my_telegram, :string
    add_column :users, :bank_payment_page, :string
    add_column :users, :accept_rights, :boolean, default: true
  end
end
