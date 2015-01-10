class CreateProjectStars < ActiveRecord::Migration
  def change
    create_table :project_stars do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false

      t.timestamps null: false

      t.index :user_id
      t.index :project_id
      t.index [:user_id, :project_id], unique: true
    end
  end
end
