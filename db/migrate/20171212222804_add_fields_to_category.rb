class AddFieldsToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :is_active, :boolean, default: true
    add_column :categories, :events_count, :integer
    add_column :categories, :category_image, :string
  end
end
