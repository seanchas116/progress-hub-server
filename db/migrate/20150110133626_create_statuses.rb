class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.string :type
      t.integer :project_id
      t.integer :task_id
      t.string :task_stage_before
      t.string :task_stage_after
      t.integer :followee_id

      t.timestamps null: false

      t.index :user_id
      t.index :type
    end
  end
end
