class AddCachedRatingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cached_rating, :integer, default: 0
  end
end
