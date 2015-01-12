class CreateStatusStars < ActiveRecord::Migration
  def change
    create_table :status_stars do |t|
      t.references :user, null: false, index: true
      t.references :status, null: false, index: true

      t.timestamps null: false

      t.index [:user_id, :status_id], unique: true
      t.foreign_key :users, dependent: :delete
      t.foreign_key :statuses, dependent: :delete
    end
  end
end
