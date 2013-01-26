class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :reflection
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
