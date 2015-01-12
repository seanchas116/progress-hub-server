class CreateTaskStars < ActiveRecord::Migration
  def change
    create_table :task_stars do |t|
      t.references :user, null: false, index: true
      t.references :task, null: false, index: true

      t.timestamps null: false

      t.index [:user_id, :task_id], unique: true

      t.foreign_key :users, dependent: :delete
      t.foreign_key :tasks, dependent: :delete
    end
  end
end
