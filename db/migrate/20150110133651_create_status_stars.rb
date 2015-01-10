class CreateStatusStars < ActiveRecord::Migration
  def change
    create_table :status_stars do |t|
      t.integer :user_id, null: false
      t.integer :status_id, null: false

      t.timestamps null: false

      t.index :user_id
      t.index :status_id
      t.index [:user_id, :status_id], unique: true
    end
  end
end
