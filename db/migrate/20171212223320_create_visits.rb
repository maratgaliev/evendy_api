class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :choice

      t.timestamps
      t.text :comment
      t.integer :author_id
    end
    add_index :visits, :author_id
  end
end
