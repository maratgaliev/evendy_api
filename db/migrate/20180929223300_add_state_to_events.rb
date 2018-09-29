class AddStateToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :state_cd, :integer, default: 0
  end
end
