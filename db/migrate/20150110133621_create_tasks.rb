class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id, null: false
      t.string :title, null: false
      t.string :url
      t.string :stage, null: false
      t.text :description

      t.timestamps null: false

      t.index :project_id
      t.index :stage
    end
  end
end
