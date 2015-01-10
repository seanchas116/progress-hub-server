class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :twitter_id

      t.timestamps null: false

      t.index :email
      t.index :twitter_id
    end
  end
end
