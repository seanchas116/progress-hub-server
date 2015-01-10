class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description
      t.string :url

      t.timestamps null: false

      t.index :user_id
    end
  end
end
