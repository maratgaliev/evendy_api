class AddFieldsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :short_description, :string
    add_column :events, :address, :string
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
    add_column :events, :preview_image, :string
    add_column :events, :background_image, :string
    add_column :events, :map_file, :string
    add_reference :events, :category, foreign_key: true
    add_column :events, :coupon_code, :string
    add_column :events, :is_private, :boolean, default: false
    add_column :events, :slug, :string
    add_column :events, :telegram, :string
    add_column :events, :price, :decimal
    add_index :events, :slug
  end
end
