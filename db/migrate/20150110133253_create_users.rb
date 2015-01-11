class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps null: false

      t.index :email
    end
  end
end
