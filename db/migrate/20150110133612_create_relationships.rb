class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, index: true
      t.references :followee, null: false, index: true

      t.timestamps null: false

      t.index [:follower_id, :followee_id], unique: true
      t.foreign_key :users, column: :follower_id, dependent: :delete
      t.foreign_key :users, column: :followee_id, dependent: :delete
    end
  end
end
