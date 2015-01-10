class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followee_id, null: false

      t.timestamps null: false

      t.index :follower_id
      t.index :followee_id
      t.index [:follower_id, :followee_id], unique: true
    end
  end
end
