class CreateProjectStars < ActiveRecord::Migration
  def change
    create_table :project_stars do |t|
      t.references :user, null: false, index: true
      t.references :project, null: false, index: true

      t.timestamps null: false

      t.index [:user_id, :project_id], unique: true
      t.foreign_key :users, dependent: :delete
      t.foreign_key :projects, dependent: :delete
    end
  end
end
