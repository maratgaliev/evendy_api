class AddAuthorNameToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :author_name, :string
  end
end
