class CreateTaskStars < ActiveRecord::Migration
  def change
    create_table :task_stars do |t|
      t.integer :user_id, null: false
      t.integer :task_id, null: false

      t.timestamps null: false

      t.index :user_id
      t.index :task_id
      t.index [:user_id, :task_id], unique: true
    end
  end
end
