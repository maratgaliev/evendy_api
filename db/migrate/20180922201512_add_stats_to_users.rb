class AddStatsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pace, :integer, default: 0
    add_column :users, :shooting, :integer, default: 0
    add_column :users, :passing, :integer, default: 0
    add_column :users, :dribbling, :integer, default: 0
    add_column :users, :defending, :integer, default: 0
    add_column :users, :physicality, :integer, default: 0
  end
end
