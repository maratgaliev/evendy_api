class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :max_limit
      t.integer :author_id
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
    add_index :events, :author_id
  end
end
