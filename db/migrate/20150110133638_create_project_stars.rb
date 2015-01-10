class CreateProjectStars < ActiveRecord::Migration
  def change
    create_table :project_stars do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps null: false

      t.index :user_id
      t.index :project_id
      t.index [:user_id, :project_id], unique: true
    end
  end
end
