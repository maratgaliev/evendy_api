class RemoveMoneyColumnsFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :price_kopecks
    remove_column :events, :price_currency
  end
end
