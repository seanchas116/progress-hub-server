class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :user, null: false, index: true
      t.string :type, null: false, index: true
      t.references :project
      t.references :task
      t.string :task_stage_before
      t.string :task_stage_after
      t.integer :followee_id

      t.timestamps null: false

      t.foreign_key :users, dependent: :delete
      t.foreign_key :projects, dependent: :delete
      t.foreign_key :tasks, dependent: :delete
      t.foreign_key :users, column: :followee_id, dependent: :delete
    end
  end
end
