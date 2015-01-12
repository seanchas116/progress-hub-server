class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project, null: false, index: true
      t.string :title, null: false
      t.string :url
      t.string :stage, null: false, index: true
      t.text :description

      t.timestamps null: false

      t.foreign_key :projects, dependent: :delete
    end
  end
end
