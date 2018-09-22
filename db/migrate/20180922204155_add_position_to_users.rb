class AddPositionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :position_cd, :integer
  end
end
